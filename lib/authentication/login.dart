import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/screen/mainapp.dart';

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
      appBar: AppBar(
        title: const Text('Sign In'),
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
          ButtonWidget(
            button: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email.text, password: password.text)
                      .then((value) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MainApp()));
                  });
                },
                child: const Text('Sign In')),
          )
        ],
      ),
    );
  }
}
