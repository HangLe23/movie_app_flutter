import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class Overview extends StatefulWidget {
  final String overview;
  const Overview({super.key, required this.overview});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  bool isMore = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          SizedBox(width: 20.h),
          Text('Overview', style: TextStyles.lato500Size19)
        ]),
        SizedBox(height: 5.w),
        Row(
          children: [
            SizedBox(width: 20.h),
            Expanded(
              child: RichText(
                text: widget.overview.isEmpty || widget.overview == 'null'
                    ? TextSpan(
                        text: 'No overview', style: TextStyles.decription)
                    : widget.overview.length < 200
                        ? TextSpan(
                            text: widget.overview, style: TextStyles.decription)
                        : TextSpan(
                            children: [
                              TextSpan(
                                text: isMore
                                    ? widget.overview.substring(0, 200)
                                    : widget.overview,
                                style: TextStyles.decription,
                              ),
                              TextSpan(
                                text: isMore ? '...Read More' : ' Read Less',
                                style: TextStyles.lato400Size14,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      isMore = !isMore;
                                    });
                                  },
                              )
                            ],
                          ),
              ),
            )
          ],
        )
      ],
    );
  }
}
