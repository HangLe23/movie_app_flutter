import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

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
        title:
            Center(child: Text('THE MOVIE', style: TextStyles.titleTheMovie)),
        backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/themovie_app_icon.png', height: 200.w),
              Center(
                child: Text('Forgot Password', style: TextStyles.titleAuthen),
              ),
              SizedBox(height: 20.w),
              Row(
                children: [
                  SizedBox(width: 20.h),
                  Text('Email', style: TextStyles.lato400Size20),
                ],
              ),
              SizedBox(height: 5.w),
              TextFieldWidget(
                textedit: email,
                hint: 'Enter your email',
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? 'Enter a valid email'
                      : null;
                },
              ),
              SizedBox(height: 20.w),
              ButtonWidget(
                function: () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: email.text);
                },
                text: 'Send email',
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Back to login',
                  style: TextStyles.bluetext,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
