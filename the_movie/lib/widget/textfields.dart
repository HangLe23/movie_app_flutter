import 'package:flutter/material.dart';

import '../untils/TextStyles/TextStyles.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textedit;
  final String hint;
  final String? Function(String?)
      function; // Changed parameter name to function

  const TextFieldWidget(
      {Key? key, // Added missing Key parameter
      required this.textedit,
      required this.hint,
      required this.function})
      : super(key: key); // Used named parameter for super constructor

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
      child: TextFormField(
        controller: textedit,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyles.lato400Size20,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: hint,
          border: InputBorder.none,
        ),
        validator: function,
      ),
    );
  }
}
