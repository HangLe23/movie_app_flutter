import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../index.dart';

class IconPlay extends StatelessWidget {
  final Function() onTap;
  const IconPlay({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.h,
        height: 33.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33.r),
            color: CustomColors.gradientbg),
        child: Center(
          child: Icon(
            Icons.play_arrow,
            color: CustomColors.w25,
          ),
        ),
      ),
    );
  }
}
