import 'package:flutter/material.dart';

import '../untils/TextStyles/TextStyles.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textedit;
  final String hint;

  const TextFieldWidget(
      {super.key, required this.textedit, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white),
        color: Colors.white30,
      ),
      child: TextField(
        controller: textedit,
        style: TextStyles.lato400Size20,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}
