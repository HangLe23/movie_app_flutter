import 'package:flutter/material.dart';

import '../screen/detail/detail.dart';
import '../untils/TextStyles/TextStyles.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const MovieItem({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DetailScreen(),
          ));
        },
        child: Column(
          children: [
            Image.asset(imageUrl),
            Text(
              name,
              style: TextStyles.lato400Size14,
            ),
          ],
        ));
  }
}
