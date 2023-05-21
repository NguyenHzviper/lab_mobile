// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lab04/components/button_login.dart';
import 'package:lab04/components/button_signup.dart';

class CustomForm extends StatefulWidget {
  final String typeOfForm;

  const CustomForm(this.typeOfForm, {Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Input your email address',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            controller: _emailController,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Input your password',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            controller: _passwordController,
          ),
          if (widget.typeOfForm == 'signup')
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Type your password again',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                if (value != _passwordController.text) {
                  return 'Your password does not match';
                }
                return null;
              },
              controller: _repasswordController,
            ),
          if (widget.typeOfForm == 'signup')
            SignUpButton(
                _emailController.text, _passwordController.text, _formKey),
          if (widget.typeOfForm != 'signup')
            LoginButton(
                _emailController.text, _passwordController.text, _formKey),
        ],
      ),
    );
  }
}
