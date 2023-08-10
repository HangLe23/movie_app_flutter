import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widget/button.dart';
import 'package:movie_app_flutter/widget/textfields.dart';

import '../../untils/Colors/colors.dart';
import '../../untils/TextStyles/TextStyles.dart';

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
        title: Center(
          child: Text(
            'THE MOVIE',
            style: TextStyles.titleTheMovie,
          ),
        ),
        backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Image.asset('assets/images/themovie_app_icon.png', height: 200),
            Text('Forgot Password', style: TextStyles.titleAuthen),
            const SizedBox(height: 100),
            TextFieldWidget(
                textedit: email,
                hint: 'Enter your email',
                color: Colors.white30),
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
    );
  }
}
