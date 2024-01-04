import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../untils/TextStyles/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final Function() function;
  final String text;
  const ButtonWidget({
    super.key,
    required this.function,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Colors.red,
        ),
        width: 450.h,
        height: 50.w,
        child: Center(
          child: Text(text, style: TextStyles.lato400Size24),
        ),
      ),
    );
  }
}
