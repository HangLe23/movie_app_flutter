import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/widget/textfields.dart';

import '../authentication/login.dart';
import '../untils/Colors/colors.dart';
import '../untils/TextStyles/TextStyles.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController email = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Profile',
              style: TextStyles.tittle,
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
                  });
                },
                child: Text(
                  'Logout',
                  style: TextStyles.lato500Size24,
                ))
          ],
        ),
        backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
        elevation: 0,
      ),
      body: Column(
        children: [TextFieldWidget(textedit: email, hint: '')],
      ),
    );
  }
}
