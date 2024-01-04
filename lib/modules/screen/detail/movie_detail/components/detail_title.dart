import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class DetailTitle extends StatefulWidget {
  final String title, runtime, voteAverage;
  const DetailTitle(
      {super.key,
      required this.title,
      required this.runtime,
      required this.voteAverage});

  @override
  State<DetailTitle> createState() => _DetailTitleState();
}

class _DetailTitleState extends State<DetailTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20.h),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.title,
                      style: TextStyles.lato500Size28,
                    ),
                    const WidgetSpan(child: SizedBox(width: 10)),
                    WidgetSpan(
                      child: CardWidget(
                        widget: Center(
                          child: Text('4K', style: TextStyles.lato400Size14),
                        ),
                        radius: 6.r,
                        width: 34.95.h,
                        height: 26.55.w,
                        color: CustomColors.rectangle,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.w),
        Row(
          children: [
            SizedBox(width: 20.h),
            CustomIcons.time,
            SizedBox(width: 5.h),
            Text(widget.runtime, style: TextStyles.decription),
            SizedBox(width: 5.h),
            Text('minutes', style: TextStyles.decription),
            SizedBox(width: 20.h),
            CustomIcons.starGrey,
            SizedBox(width: 5.h),
            Text(widget.voteAverage, style: TextStyles.decription),
            Text('(IMDb)', style: TextStyles.decription)
          ],
        ),
      ],
    );
  }
}
