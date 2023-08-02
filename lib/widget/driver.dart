import 'package:flutter/material.dart';

import '../untils/Colors/colors.dart';

class DriverWidget extends StatelessWidget {
  const DriverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 150,
      margin: const EdgeInsets.all(20),
      color: CustomColors.line,
    );
  }
}
