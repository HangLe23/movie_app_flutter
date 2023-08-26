import 'package:flutter/material.dart';
import 'package:movie_app_flutter/components/index.dart';

import '../untils/TextStyles/TextStyles.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String year;
  final Function() onTap;

  const MovieItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.onTap,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: InternetImage(
                imageUrl: imageUrl,
              )),
          const SizedBox(height: 15),
          Text('$name ($year)',
              style: TextStyles.lato400Size14, textAlign: TextAlign.left),
        ]));
  }
}
