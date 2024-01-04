import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class TopRateItem extends StatelessWidget {
  final String imgURL;
  final String name;
  final double imdb;
  final Function() onTap;
  const TopRateItem(
      {super.key,
      required this.imgURL,
      required this.name,
      required this.imdb,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: InternetImage(
              imageUrl: imgURL,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.05,
            bottom: 50.w,
            child: CardWidget(
              color: Colors.white30,
              widget: Center(
                  child: Text(
                name,
                style: TextStyles.lato400Size19,
                textAlign: TextAlign.center,
              )),
              radius: 24.r,
              width: 175.h,
              height: 55.w,
            ),
          ),
          Positioned(
            top: 15.w,
            right: 15.h,
            child: CardWidget(
              color: Colors.white30,
              widget: Column(
                children: [
                  SizedBox(height: 5.w),
                  Text('IMDb', style: TextStyles.IMDb),
                  SizedBox(height: 5.w),
                  Row(
                    children: [
                      SizedBox(width: 15.h),
                      CustomIcons.star,
                      SizedBox(width: 5.h),
                      Text(imdb.toString(), style: TextStyles.lato400Size19)
                    ],
                  )
                ],
              ),
              radius: 18.r,
              width: 80.h,
              height: 50.w,
            ),
          )
        ],
      ),
    );
  }
}
