import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class BannerDetail extends StatelessWidget {
  final String imgUrl;
  const BannerDetail({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imgUrl.isEmpty || imgUrl == 'null'
            ? Image.asset(
                'assets/images/themovie_app_icon.png',
                height: 230.w,
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
            radius: 55.r,
            width: 55.h,
            height: 55.w,
          ),
        ),
        Positioned(
          left: 175.h,
          top: 100.w,
          child: CardWidget(
            widget: Center(
                child: IconPlay(
              onTap: () {},
            )),
            radius: 77.r,
            width: 77.h,
            height: 77.w,
            color: Colors.white30,
          ),
        )
      ],
    );
  }
}
