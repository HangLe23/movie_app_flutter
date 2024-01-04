import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class ReleaseDate extends StatelessWidget {
  final String first, last;
  const ReleaseDate({super.key, required this.first, required this.last});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First air date', style: TextStyles.lato500Size19),
            SizedBox(height: 5.w),
            Text(first, style: TextStyles.decription),
          ],
        ),
        SizedBox(width: 20.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Last air date', style: TextStyles.lato500Size19),
            SizedBox(height: 5.w),
            Text(last, style: TextStyles.decription),
          ],
        ),
      ],
    );
  }
}
