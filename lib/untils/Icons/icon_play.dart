import 'package:flutter/material.dart';
import 'package:movie_app_flutter/untils/Colors/colors.dart';

class IconPlay extends StatelessWidget {
  final Function() onTap;
  const IconPlay({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 33,
        height: 33,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
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
