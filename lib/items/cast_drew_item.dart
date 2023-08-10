import 'package:flutter/material.dart';

import '../untils/TextStyles/TextStyles.dart';

class CastDrewItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  const CastDrewItem({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(imageUrl)),
        const SizedBox(height: 15),
        Text(
          name,
          style: TextStyles.lato400Size14,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
