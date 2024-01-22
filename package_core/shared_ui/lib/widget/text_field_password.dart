import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../untils/untils.dart';

class TextFieldPassword extends StatefulWidget {
  final TextEditingController textedit;
  final String hint;
  final String? Function(String?) validator;

  const TextFieldPassword({
    Key? key,
    required this.textedit,
    required this.hint,
    required this.validator,
  }) : super(key: key);

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    bool isObscured = true;
    return 
      TextFormField(
          controller: widget.textedit,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyles.lato400Size20,
          decoration: InputDecoration(
              hintText: widget.hint,
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(24.r)),
              fillColor: CustomColors.search,
              filled: true,
              suffixIcon: IconButton(
      icon: Icon(
        // ignore: dead_code
        isObscured ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isObscured = !isObscured;
        });
      },
    ),
              ),
          obscureText: true,
          validator: widget.validator,
      );
  }
}
