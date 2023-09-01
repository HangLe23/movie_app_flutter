import 'package:flutter/material.dart';
import 'package:movie_app_flutter/authentication/register/register_body.dart';
import 'package:movie_app_flutter/untils/untils.dart';

class Register extends StatelessWidget {
  const Register({super.key});
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
              Text('Register', style: TextStyles.titleAuthen)
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const RegisterBody());
  }
}
