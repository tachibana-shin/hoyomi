import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in_all_platforms/google_sign_in_all_platforms.dart'
    as g_all;
import 'package:google_sign_in/google_sign_in.dart' as g_native;
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/x_platform.dart';

final _googleNativeSupport = XPlatform.isAndroid ||
    XPlatform.isIOS ||
    XPlatform.isMacOS ||
    XPlatform.isWeb;

class Authentication {
  static final Authentication _instance = Authentication._internal();
  static Authentication get instance => _instance;

  Authentication._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _clientId = dotenv.env['GOOGLE_CLIENT_ID'];
  final _clientSecret = dotenv.env['GOOGLE_CLIENT_SECRET'];
  final _redirectPort =
      int.tryParse(dotenv.env['GOOGLE_REDIRECT_PORT'] ?? '') ?? 9003;

  late final _googleSignIn =
      _googleNativeSupport ? g_native.GoogleSignIn() : null;
  late final _googleSignInAll = _googleNativeSupport
      ? null
      : g_all.GoogleSignIn(
          params: g_all.GoogleSignInParams(
            clientId: _clientId,
            clientSecret: _clientSecret,
            redirectPort: _redirectPort,
          ),
        );

  Future<User?> signInWithGoogle() async {
    assert(_googleSignIn != null || _googleSignInAll != null);

    bool firebaseError = false;
    try {
      // if (kIsWeb) {
      //   final googleProvider = GoogleAuthProvider();
      //   final userCredential = await _auth.signInWithPopup(googleProvider);

      //   final user = userCredential.user;

      //   if (user != null) {
      //     showSnackBar(Text('Logged in as ${user.displayName ?? user.email}'));
      //   }

      //   return user;
      // }

      late final OAuthCredential credential;
      if (_googleSignIn != null) {
        final client = await _googleSignIn.signIn();
        final googleAuth = await client?.authentication;

        if (googleAuth == null) throw Exception('Google Sign-In failed.');

        credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      } else {
        final googleAuth = await _googleSignInAll!.signIn();

        if (googleAuth == null) throw Exception('Google Sign-In failed.');

        credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        showSnackBar(Text('Logged in as ${user.displayName ?? user.email}'));
      }

      return user;
    } on FirebaseAuthException catch (err) {
      firebaseError = true;
      _catchFirebaseAuthException(err);

      rethrow;
    } catch (e) {
      if (!firebaseError) _catchNormalException(e);

      rethrow;
    }
  }

  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      showSnackBar(Text(
          'Welcome back, ${credential.user?.displayName ?? credential.user?.email}'));

      return credential.user;
    } on FirebaseAuthException catch (err) {
      _catchFirebaseAuthException(err);

      rethrow;
    } catch (e) {
      _catchNormalException(e);

      rethrow;
    }
  }

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    late final User user;
    final auth = _auth;

    try {
      if (auth.currentUser?.isAnonymous == true) {
        final currentUser = auth.currentUser;
        if (currentUser != null) {
          await currentUser.verifyBeforeUpdateEmail(email);
          await currentUser.updatePassword(password);
          await currentUser.reload();
        }
        user = currentUser!;
      } else {
        user = (await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ))
            .user!;
      }

      showSnackBar(Text('Welcome, ${user.displayName ?? user.email}'));

      return user;
    } on FirebaseAuthException catch (err) {
      _catchFirebaseAuthException(err);

      rethrow;
    } catch (e) {
      _catchNormalException(e);

      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn?.signOut();
      await _googleSignInAll?.signOut();
      await _auth.signOut();

      showSnackBar(Text('Signed out.'));
    } catch (err) {
      debugPrint('[google_sign_out]: Error $err');

      showSnackBar(Text('Error signing out. Try again.'));
    }
  }

  User? get currentUser => _auth.currentUser;

  void _catchFirebaseAuthException(FirebaseAuthException err) {
    debugPrint('Error: $err');
    switch (err.code) {
      case 'account-exists-with-different-credential':
        showSnackBar(
            Text('The account already exists with a different credential.'));
        break;
      case 'invalid-credential':
        showSnackBar(
            Text('Error occurred while accessing credentials. Try again.'));
        signOut();
        break;
      default:
        showSnackBar(Text('Error occurred: ${err.message ?? err.code}'));
    }
  }

  void _catchNormalException(dynamic err) {
    debugPrint('Error: $err');
    showSnackBar(Text('Error occurred Auth: $err'));
  }
}
