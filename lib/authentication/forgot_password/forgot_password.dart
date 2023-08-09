import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widget/button.dart';
import 'package:movie_app_flutter/widget/textfields.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Column(
        children: [
          TextFieldWidget(
              textedit: email, hint: 'Enter your email', color: Colors.white30),
          ButtonWidget(
              function: () {
                FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
              },
              text: 'Send email')
        ],
      ),
    );
  }
}
