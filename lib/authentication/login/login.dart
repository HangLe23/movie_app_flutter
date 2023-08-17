import 'package:flutter/material.dart';
import 'package:movie_app_flutter/authentication/login/login_body.dart';
import 'package:movie_app_flutter/untils/Colors/colors.dart';
import 'package:movie_app_flutter/untils/TextStyles/TextStyles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final key = GlobalKey<FormState>();
  final email = TextEditingController();
  final pass = TextEditingController();
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
              Text('Login', style: TextStyles.titleAuthen)
            ],
          ),
          backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
          elevation: 0,
        ),
        body: const LoginBody());
  }
}
