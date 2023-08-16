import 'package:flutter/material.dart';
import 'package:movie_app_flutter/untils/Colors/colors.dart';
import 'package:movie_app_flutter/untils/TextStyles/TextStyles.dart';

import 'login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
