import 'package:flutter/material.dart';
import 'package:movie_app_flutter/components/index.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class BannerHome extends StatelessWidget {
  final String imgUrl;
  const BannerHome({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: InternetImage(
          imageUrl: imgUrl,
          width: 395,
          height: 230,
        ),
      ),
      Positioned(
          left: 15,
          bottom: 20,
          child: CardWidget(
              color: Colors.white30,
              widget: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  IconPlay(onTap: () {}),
                  const SizedBox(width: 20),
                  Text('Offical trailer', style: TextStyles.lato400Size19)
                ],
              ),
              radius: 24,
              width: 255,
              height: 75))
    ]);
  }
}
