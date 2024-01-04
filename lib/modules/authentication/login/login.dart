import 'package:flutter/material.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

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
          title:
              Center(child: Text('THE MOVIE', style: TextStyles.titleTheMovie)),

          backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
          elevation: 0,
        ),
        body: const LoginBody());
  }
}
