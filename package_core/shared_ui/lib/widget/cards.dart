import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Color color;
  final double radius, width, height;
  final Widget widget;
  const CardWidget(
      {super.key,
      required this.widget,
      required this.radius,
      required this.width,
      required this.height,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: color),
      child: widget,
    );
  }
}
