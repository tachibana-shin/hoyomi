import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in_all_platforms/google_sign_in_all_platforms.dart'
    as g_all;
import 'package:google_sign_in/google_sign_in.dart' as g_native;
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/constraints/x_platform.dart';
import 'package:hoyomi/env.dart';
import 'package:hoyomi/plugins/logger.dart';
import 'package:kaeru/kaeru.dart';

final _googleNativeSupport =
    XPlatform.isAndroid ||
    XPlatform.isIOS ||
    XPlatform.isMacOS ||
    XPlatform.isWeb;

class Authentication {
  static final Authentication _instance = Authentication._internal();
  static Authentication get instance => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final _user = Ref<User?>(_auth.currentUser);
  final _clientId = Env.googleClientId;
  final _clientSecret = Env.googleClientSecret;
  final _redirectPort = Env.googleRedirectPort;

  late final _googleSignIn = _googleNativeSupport
      ? g_native.GoogleSignIn()
      : null;
  late final _googleSignInAll = _googleNativeSupport
      ? null
      : g_all.GoogleSignIn(
          params: g_all.GoogleSignInParams(
            clientId: _clientId,
            clientSecret: _clientSecret,
            redirectPort: _redirectPort,
          ),
        );

  Completer<void>? _futureInitializeUser = Completer<void>();

  Authentication._internal() {
    if (_auth.currentUser != null) {
      _user.value = _auth.currentUser;
    }

    bool firstChanged = false;
    _auth.authStateChanges().listen(
      (user) {
        if (_futureInitializeUser == null || firstChanged || user != null) {
          _user.value = user;

          if (_futureInitializeUser != null) {
            _futureInitializeUser!.complete();
            _futureInitializeUser = null;
          }
        } else {
          firstChanged = true;
        }
      },
      onError: (error) {
        _user.value = null;
        logger.e(error);
      },
    );
  }

  Future<User?> signInWithGoogle() async {
    assert(
      _googleSignIn != null || _googleSignInAll != null,
      'No Google Sign-In implementation available for this platform',
    );

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

        if (googleAuth == null) return null; // User cancelled sign-in

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
    } on FirebaseAuthException catch (err, stack) {
      firebaseError = true;
      _catchFirebaseAuthException(err, stack);

      rethrow;
    } catch (e, stack) {
      if (!firebaseError) _catchNormalException(e, stack);

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

      showSnackBar(
        Text(
          'Welcome back, ${credential.user?.displayName ?? credential.user?.email}',
        ),
      );

      return credential.user;
    } on FirebaseAuthException catch (err, stack) {
      _catchFirebaseAuthException(err, stack);

      rethrow;
    } catch (e, stack) {
      _catchNormalException(e, stack);

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
        )).user!;
      }

      showSnackBar(Text('Welcome, ${user.displayName ?? user.email}'));

      return user;
    } on FirebaseAuthException catch (err, stack) {
      _catchFirebaseAuthException(err, stack);

      rethrow;
    } catch (e, stack) {
      _catchNormalException(e, stack);

      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn?.signOut();
      await _googleSignInAll?.signOut();
      await _auth.signOut();

      showSnackBar(Text('Signed out.'));
    } catch (err, stack) {
      logger.e('[google_sign_out]: Error $err', stackTrace: stack);

      showSnackBar(Text('Error signing out. Try again.'));
    }
  }

  Future<User?> getUserAsync() async {
    await _futureInitializeUser?.future;

    return _user.value;
  } // =================== utils ===================

  void _catchFirebaseAuthException(
    FirebaseAuthException err,
    StackTrace trace,
  ) {
    logger.e(err, stackTrace: trace);
    switch (err.code) {
      case 'account-exists-with-different-credential':
        showSnackBar(
          Text('The account already exists with a different credential.'),
        );
        break;
      case 'invalid-credential':
        showSnackBar(
          Text('Error occurred while accessing credentials. Try again.'),
        );
        signOut();
        break;
      default:
        showSnackBar(Text('Error occurred: ${err.message ?? err.code}'));
    }
  }

  void _catchNormalException(dynamic err, StackTrace stack) {
    logger.e(err, stackTrace: stack);
    showSnackBar(Text('Error occurred Auth: $err'));
  }
}
