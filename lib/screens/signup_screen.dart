// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lab04/components/form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        centerTitle: true,
      ),
      body: Center(
        child: CustomForm("signup"),
      ),
    );
  }
}
