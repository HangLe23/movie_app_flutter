import 'package:flutter/material.dart';
import 'package:movie_app_flutter/components/index.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class BannerTvSeries extends StatelessWidget {
  final String imgUrl;
  const BannerTvSeries({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imgUrl.isEmpty || imgUrl == 'null'
            ? Image.asset(
                'assets/images/themovie_app_icon.png',
                height: 230,
              )
            : InternetImage(
                imageUrl: imgUrl,
              ),
        Positioned(
            left: 20,
            top: 30,
            child: CardWidget(
                color: Colors.white30,
                widget: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                radius: 55,
                width: 55,
                height: 55)),
      ],
    );
  }
}
