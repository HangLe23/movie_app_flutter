import 'package:flutter/material.dart';
import 'package:movie_app_flutter/components/catch_images/image_internet.dart';

import '../../untils/TextStyles/TextStyles.dart';

class CastDrewItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  const CastDrewItem({Key? key, required this.imageUrl, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: imageUrl.isEmpty || imageUrl == 'null'
              ? Container(
                  width: 200,
                  height: 225,
                  color: Colors.white,
                  child: Image.asset('assets/images/default.png'))
              : InternetImage(imageUrl: imageUrl),
        ),
        const SizedBox(height: 10),
        Text(name,
            style: TextStyles.lato400Size14, textAlign: TextAlign.center),
      ],
    );
  }
}
