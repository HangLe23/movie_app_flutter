import 'package:flutter/material.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroudcolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              Center(child: Text('THE MOVIE', style: TextStyles.titleTheMovie)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const RegisterBody());
  }
}
