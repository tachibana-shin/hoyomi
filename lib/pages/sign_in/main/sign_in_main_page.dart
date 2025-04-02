/// Fork from https://github.com/supabase-community/flutter-auth-ui
library;

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hoyomi/apis/show_snack_bar.dart';
import 'package:hoyomi/utils/authentication.dart';
import 'package:hoyomi/widgets/iconify.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';

class SignInMainPage extends StatefulWidget {
  final bool oauth2WithIcon;

  const SignInMainPage({super.key, this.oauth2WithIcon = false});

  @override
  State<SignInMainPage> createState() => _SignInMainPageState();
}

class _SignInMainPageState extends State<SignInMainPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isSigningIn = true;

  bool _isLoading = false;
  bool _isRecoveringPassword = false;

  bool _signed = true;

  final _emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          _signed = false;
          return Scaffold(
              appBar: AppBar(title: Text(_isSigningIn ? 'Sign in' : 'Sign up')),
              body: ListView(padding: const EdgeInsets.all(24.0), children: [
                _buildEmailAuth(),
                const Divider(),
                SizedBox(height: 15),
                _buildOAuth2()
              ]));
        }

        Future.microtask(() {
          if (_signed) showSnackBar(Text('You are already signed in'));
          if (context.mounted) context.pop();
        });

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildEmailAuth() {
    return AutofillGroup(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autofocus: true,
              focusNode: _emailFocusNode,
              textInputAction: _isRecoveringPassword
                  ? TextInputAction.done
                  : TextInputAction.next,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !EmailValidator.validate(_emailController.text)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                label: Text('E-mail'),
                border: OutlineInputBorder(),
              ),
              controller: _emailController,
              onFieldSubmitted: (_) {
                if (_isRecoveringPassword) {
                  _passwordRecovery();
                }
              },
            ),
            if (!_isRecoveringPassword) ...[
              SizedBox(height: 16),
              TextFormField(
                autofillHints: _isSigningIn
                    ? [AutofillHints.password]
                    : [AutofillHints.newPassword],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction:
                    !_isSigningIn ? TextInputAction.next : TextInputAction.done,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Please enter a password that is at least 6 characters long';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  label: Text('Password'),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                controller: _passwordController,
              ),
              if (!_isSigningIn) ...[
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    label: Text('Confirm Password'),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ],
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _signInSignUp,
                child: _isLoading
                    ? SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                          strokeWidth: 1.5,
                        ),
                      )
                    : Text(_isSigningIn ? 'Sign in' : 'Sign up'),
              ),
              SizedBox(height: 16),
              if (_isSigningIn) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isRecoveringPassword = true;
                    });
                  },
                  child: Text('Forgot your password?'),
                ),
              ],
              TextButton(
                key: const ValueKey('toggleSignInButton'),
                onPressed: () {
                  setState(() {
                    _isRecoveringPassword = false;
                    _isSigningIn = !_isSigningIn;
                  });
                },
                child: Text(_isSigningIn
                    ? 'Don\'t have an account? Sign up'
                    : 'Already have an account? Sign in'),
              ),
            ],
            if (_isSigningIn && _isRecoveringPassword) ...[
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _passwordRecovery,
                child: Text('Send password reset email'),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isRecoveringPassword = false;
                  });
                },
                child: Text('Back to sign in'),
              ),
            ],
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _passwordRecovery() async {
    try {
      if (!_formKey.currentState!.validate()) {
        // Focus on email field if validation fails
        _emailFocusNode.requestFocus();
        return;
      }
      setState(() {
        _isLoading = true;
      });

      final email = _emailController.text.trim();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      if (!mounted) return;

      showSnackBar(Text('Password reset email has been sent'));

      setState(() {
        _isRecoveringPassword = false;
      });
    } catch (error) {
      showSnackBar(Text('Error: $error'));
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _signInSignUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      if (_isSigningIn) {
        await Authentication.instance.signInWithEmail(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (!mounted) return;
        context.pop();
      } else {
        await Authentication.instance.signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (!mounted) return;
        setState(() {
          _isSigningIn = true;
          _isRecoveringPassword = false;
        });
      }
    } catch (error) {
      _emailFocusNode.requestFocus();
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildOAuth2() {
    final authButtons = [
      _generateButtonOAuth(_SocialOauth2('google'), icon: widget.oauth2WithIcon,
          onTap: () {
        Authentication.instance.signInWithGoogle();
      }),
    ];

    return widget.oauth2WithIcon
        ? Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: authButtons,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: authButtons,
          );
  }
}

class _SocialOauth2 {
  final String name;

  const _SocialOauth2(this.name);

  String get iconData => switch (name) {
        'apple' => Logos.apple,
        'azure' => Logos.microsoft,
        'bitbucket' => Logos.bitbucket,
        'discord' => Logos.discord,
        'facebook' => Logos.facebook,
        'figma' => Logos.figma,
        'github' => Logos.github,
        'gitlab' => Logos.gitlab,
        'google' => Logos.google_icon,
        'linkedin' => Logos.linkedin,
        'slack' => Logos.slack,
        'spotify' => Logos.spotify,
        'twitch' => Logos.twitch,
        'twitter' => Logos.twitter,
        _ => '',
      };

  Color get btnBgColor => switch (name) {
        'apple' => Colors.black,
        'azure' => Colors.blueAccent,
        'bitbucket' => Colors.blue,
        'discord' => Colors.purple,
        'facebook' => const Color(0xFF3b5998),
        'figma' => const Color.fromRGBO(241, 77, 27, 1),
        'github' => Colors.black,
        'gitlab' => Colors.deepOrange,
        'google' => Colors.white,
        'kakao' => const Color(0xFFFFE812),
        'keycloak' => const Color.fromRGBO(0, 138, 170, 1),
        'linkedin' => const Color.fromRGBO(0, 136, 209, 1),
        'notion' => const Color.fromRGBO(69, 75, 78, 1),
        'slack' => const Color.fromRGBO(74, 21, 75, 1),
        'spotify' => Colors.green,
        'twitch' => Colors.purpleAccent,
        'twitter' => Colors.black,
        'workos' => const Color.fromRGBO(99, 99, 241, 1),
        // ignore: unreachable_switch_case
        _ => Colors.black,
      };

  String get labelText =>
      'Continue with ${name[0].toUpperCase()}${name.substring(1)}';
}

Widget _generateButtonOAuth(_SocialOauth2 socialOAuth2,
    {bool icon = false, required VoidCallback onTap}) {
  // var foregroundColor = socialOAuth2.btnBgColor;
  var backgroundColor = socialOAuth2.btnBgColor;
  // var overlayColor = Colors.white10;

  // final iconColor = Colors.white;

  if (socialOAuth2.name == 'google') {
    // foregroundColor = Colors.black;
    backgroundColor = Colors.white;
    // overlayColor = Colors.white;
  }

  Widget iconWidget = Iconify(socialOAuth2.iconData, size: 30);

  final authButtonStyle = ButtonStyle(
    // foregroundColor: WidgetStateProperty.all(foregroundColor),
    // backgroundColor: WidgetStateProperty.all(backgroundColor),
    // overlayColor: WidgetStateProperty.all(overlayColor),
    // iconColor: WidgetStateProperty.all(iconColor),
    padding: WidgetStateProperty.all(EdgeInsets.all(12)),
  );

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    child: icon
        ? Material(
            shape: const CircleBorder(),
            elevation: 2,
            color: backgroundColor,
            child: InkResponse(
              radius: 24,
              onTap: onTap,
              child: iconWidget,
            ),
          )
        : ElevatedButton.icon(
            icon: iconWidget,
            style: authButtonStyle,
            onPressed: onTap,
            label: Text(socialOAuth2.labelText),
          ),
  );
}
