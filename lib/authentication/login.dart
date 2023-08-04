import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/authentication/authen_service.dart';
import 'package:movie_app_flutter/authentication/forgot_password.dart';
import 'package:movie_app_flutter/authentication/register.dart';
import 'package:movie_app_flutter/screen/main/mainapp.dart';
import 'package:movie_app_flutter/untils/Colors/colors.dart';
import 'package:movie_app_flutter/untils/TextStyles/TextStyles.dart';
import 'package:movie_app_flutter/widget/buttonService.dart';
import 'package:movie_app_flutter/widget/driver.dart';

import '../widget/button.dart';
import '../widget/textfields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      appBar: AppBar(
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
        child: Column(
          children: [
            Image.asset(
              'assets/images/themovie_app_icon.png',
              height: 200,
            ),
            Text(
              'Login',
              style: TextStyles.titleAuthen,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 350,
              child: Text(
                'Email',
                style: TextStyles.lato400Size24,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFieldWidget(textedit: email, hint: 'Enter your email'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 350,
              child: Text(
                'Password',
                style: TextStyles.lato400Size24,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFieldWidget(textedit: password, hint: 'Enter your password'),
            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotPassword()));
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyles.bluetext,
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            ButtonWidget(
              function: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email.text, password: password.text)
                    .then((value) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MainApp()));
                });
              },
              text: 'Sign In',
            ),
            Row(
              children: [
                DriverWidget(
                  color: CustomColors.lineGrey,
                  height: 1,
                  width: 150,
                ),
                Text(
                  'OR',
                  style: TextStyles.or,
                ),
                DriverWidget(
                  color: CustomColors.lineGrey,
                  height: 1,
                  width: 150,
                )
              ],
            ),
            AuthenService(
                function: () {
                  AuthenServiceOnTap().signInWithGoogle().then((value) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MainApp()));
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
                  'You do not have account?',
                  style: TextStyles.lato400Size20,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Register(),
                    ));
                  },
                  child: Text(
                    'Sign Up',
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
      ),
    );
  }
}
