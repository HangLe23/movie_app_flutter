import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

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
      backgroundColor: CustomColors.backgroudcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 300,
        flexibleSpace: Column(
          children: [
            const SizedBox(height: 40),
            Text('THE MOVIE', style: TextStyles.titleTheMovie),
            Image.asset('assets/images/themovie_app_icon.png', height: 200),
            Text('Forgot Password', style: TextStyles.titleAuthen)
          ],
        ),
        backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              TextFieldWidget(
                textedit: email,
                hint: 'Enter your email',
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? 'Enter a valid email'
                      : null;
                },
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                  function: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email.text);
                  },
                  text: 'Send email')
            ],
          ),
        ),
      ),
    );
  }
}
