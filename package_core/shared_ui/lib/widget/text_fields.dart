import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../untils/untils.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textedit;
  final String hint;
  final String? Function(String?) validator;

  const TextFieldWidget({
    Key? key,
    required this.textedit,
    required this.hint,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textedit,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyles.lato400Size20,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24.r)),
          fillColor: Colors.white30,
          filled: true),
      validator: validator,
    );
  }
}
