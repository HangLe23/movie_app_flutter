import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/authentication/login.dart';
import 'package:movie_app_flutter/untils/Colors/colors.dart';
import 'package:movie_app_flutter/widget/button.dart';
import 'package:movie_app_flutter/widget/textfields.dart';

import '../screen/mainapp.dart';
import '../untils/TextStyles/TextStyles.dart';
import '../widget/buttonService.dart';
import '../widget/driver.dart';
import 'authen_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyles.titleAuthen,
        ),
        backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
        elevation: 0,
      ),
      body: Column(
        children: [
          TextFieldWidget(textedit: email, hint: 'Enter your email'),
          const SizedBox(
            height: 20,
          ),
          TextFieldWidget(textedit: password, hint: 'Enter your password'),
          const SizedBox(
            height: 20,
          ),
          TextFieldWidget(textedit: confirm, hint: 'Confirm your password'),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            function: () {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: email.text, password: password.text)
                  .then((value) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Login()));
              });
            },
            text: 'Sign Up',
          ),
          Row(
            children: [
              const DriverWidget(),
              Text(
                'OR',
                style: TextStyles.or,
              ),
              const DriverWidget()
            ],
          ),
          AuthenService(
              function: () {
                AuthenServiceOnTap().signInWithGoogle().then((value) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MainApp()));
                });
              },
              text: 'Login with google',
              image: 'assets/images/google.png'),
          const SizedBox(
            height: 5,
          ),
          AuthenService(
              function: () {},
              text: 'Login with facebook',
              image: 'assets/images/Facebook.png'),
          const SizedBox(
            height: 5,
          ),
          AuthenService(
              function: () {},
              text: 'Login with apple',
              image: 'assets/images/apple.png'),
          Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              Text(
                'You have an account?',
                style: TextStyles.lato400Size20,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Login(),
                  ));
                },
                child: Text(
                  'Sign In',
                  style: TextStyles.signup,
                ),
              ),
              const SizedBox(
                width: 40,
              )
            ],
          )
        ],
      ),
    );
  }
}
