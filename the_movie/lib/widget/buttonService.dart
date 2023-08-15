import 'package:flutter/material.dart';

import '../untils/TextStyles/TextStyles.dart';

class AuthenService extends StatelessWidget {
  final Function() function;
  final String text;
  final String image;
  const AuthenService(
      {super.key,
      required this.function,
      required this.text,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        width: 350,
        height: 50,
        child: Row(children: [
          const SizedBox(
            width: 50,
          ),
          Image.asset(
            image,
            width: 30,
            height: 20,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyles.lato400Size18,
          ),
          //const SizedBox(width: 100),
        ]),
      ),
    );
  }
}
