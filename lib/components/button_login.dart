import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab04/services/auth.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton(this.email, this.password, this._formKey, {Key? key})
      : super(key: key);
  final String email;
  final String password;
  final GlobalKey<FormState> _formKey;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final Auth _auth = Auth();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: OutlinedButton(
        onPressed: () async {
          if (widget._formKey.currentState!.validate()) {
            try {
              await _auth.login(widget.email.trim(), widget.password.trim());

              _scaffoldMessengerKey.currentState?.showSnackBar(
                const SnackBar(content: Text('Login success')),
              );
            } catch (e) {
              if (e is FirebaseException) {
                String errorMessage = e.message.toString();
                _scaffoldMessengerKey.currentState?.showSnackBar(
                  SnackBar(content: Text(errorMessage)),
                );
              } else {
                _scaffoldMessengerKey.currentState?.showSnackBar(
                  const SnackBar(content: Text("I don't know :)")),
                );
              }
            }
          }
        },
        child: const Text("Login"),
      ),
    );
  }
}
