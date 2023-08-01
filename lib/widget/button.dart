import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Widget button;
  const ButtonWidget({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.red,
      ),
      width: 350,
      height: 50,
      child: button,
    );
  }
}
