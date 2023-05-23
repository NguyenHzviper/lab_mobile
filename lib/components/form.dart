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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
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
            controller: emailController,
            onChanged: (value) {
              setState(() {});
            },
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
            controller: passwordController,
            onChanged: (value) {
              setState(() {});
            },
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
                if (value != passwordController.text) {
                  return 'Your password does not match';
                }
                return null;
              },
              controller: repasswordController,
              onChanged: (value) {
                setState(() {});
              },
            ),
          if (widget.typeOfForm == 'signup')
            SignUpButton(
                emailController.text, passwordController.text, _formKey),
          if (widget.typeOfForm != 'signup')
            LoginButton(
                emailController.text, passwordController.text, _formKey),
        ],
      ),
    );
  }
}
