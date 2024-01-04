import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

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
              )
            : InternetImage(
                imageUrl: imgUrl,
              ),
        Positioned(
          left: 20.h,
          top: 30.w,
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
            radius: 45.r,
            width: 40.h,
            height: 45.w,
          ),
        ),
      ],
    );
  }
}
