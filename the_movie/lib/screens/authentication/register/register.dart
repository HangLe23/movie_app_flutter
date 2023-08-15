import 'package:flutter/material.dart';
import 'package:the_movie/screens/authentication/register/register_body.dart';
import 'package:the_movie/untils/Colors/colors.dart';

import '../../../untils/TextStyles/TextStyles.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const RegisterBody());
  }
}
