import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  final String title;
  const Titles({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
      elevation: 0,
    );
  }
}
