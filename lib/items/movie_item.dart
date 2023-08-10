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
        ));
  }
}
