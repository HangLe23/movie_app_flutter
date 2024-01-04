import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class DetailTitle extends StatelessWidget {
  final String title, voteAverage;
  const DetailTitle(
      {super.key, required this.title, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20.h),
            Flexible(
              child: Text(title, style: TextStyles.lato500Size28),
            ),
            SizedBox(width: 10.h),
            CardWidget(
              widget:
                  Center(child: Text('4K', style: TextStyles.lato400Size14)),
              radius: 6.r,
              width: 34.95.h,
              height: 26.55.w,
              color: CustomColors.rectangle,
            )
          ],
        ),
        SizedBox(height: 10.w),
        Row(
          children: [
            SizedBox(width: 20.h),
            CustomIcons.starGrey,
            SizedBox(width: 5.h),
            Text(voteAverage, style: TextStyles.decription),
            Text('(IMDb)', style: TextStyles.decription)
          ],
        ),
      ],
    );
  }
}
