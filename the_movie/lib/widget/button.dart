import 'package:flutter/material.dart';

import '../untils/TextStyles/TextStyles.dart';

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
    return GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.red,
          ),
          width: 350,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: TextStyles.lato400Size24,
            ),
          ),
        ));
  }
}
