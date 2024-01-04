import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../index.dart';

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
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.white,
        ),
        width: 300.h,
        height: 50.w,
        child: Row(children: [
          SizedBox(width: 20.h),
          Image.asset(image, width: 30.h, height: 20.w),
          SizedBox(width: 20.h),
          Text(
            text,
            style: TextStyles.lato400Size18,
          ),
        ]),
      ),
    );
  }
}
