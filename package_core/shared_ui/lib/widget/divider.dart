import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double height, width;
  final Color color;
  const DividerWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(20),
      color: color,
    );
  }
}
