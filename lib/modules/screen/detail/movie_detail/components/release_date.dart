import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class ReleaseDate extends StatelessWidget {
  final String releaseDate;
  const ReleaseDate({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Release date', style: TextStyles.lato500Size19),
        SizedBox(height: 5.w),
        Text(releaseDate, style: TextStyles.decription),
      ],
    );
  }
}
