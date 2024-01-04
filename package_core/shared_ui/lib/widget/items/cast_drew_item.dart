import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../index.dart';

class CastDrewItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  const CastDrewItem({Key? key, required this.imageUrl, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.center, // Căn chỉnh các phần tử vào giữa
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: imageUrl.isEmpty || imageUrl == 'null'
              ? Container(
                  color: Colors.white,
                  height: 200.w,
                  child: Image.asset('assets/images/default.png'),
                )
              : InternetImage(
                  imageUrl: imageUrl,
                ),
        ),
        SizedBox(height: 10.w),
        Text(
          name,
          style: TextStyles.lato400Size14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
