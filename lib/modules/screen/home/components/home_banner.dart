import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class BannerHome extends StatelessWidget {
  final String imgUrl;
  final Function() onTap;
  const BannerHome({super.key, required this.imgUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: InternetImage(
          imageUrl: imgUrl,
          width: 300.h,
          height: 200.w,
        ),
      ),
      Positioned(
        left: 15.h,
        bottom: 20.w,
        child: CardWidget(
          color: Colors.white30,
          widget: Row(
            children: [
              SizedBox(width: 10.h),
              IconPlay(onTap: onTap),
              SizedBox(width: 10.h),
              Text('Offical trailer', style: TextStyles.lato400Size19)
            ],
          ),
          radius: 24.r,
          width: 170.h,
          height: 70.w,
        ),
      )
    ]);
  }
}
