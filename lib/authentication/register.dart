import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/authentication/login.dart';
import 'package:movie_app_flutter/widget/button.dart';
import 'package:movie_app_flutter/widget/textfields.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
                      .createUserWithEmailAndPassword(
                          email: email.text, password: password.text)
                      .then((value) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                  });
                },
                child: const Text('Sign Up')),
          )
        ],
      ),
    );
  }
}
