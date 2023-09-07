import 'package:flutter/material.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class DetailTitle extends StatelessWidget {
  final String title, runtime, voteAverage;
  const DetailTitle(
      {super.key,
      required this.title,
      required this.runtime,
      required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            Flexible(
              child: Text(title, style: TextStyles.lato500Size28),
            ),
            const SizedBox(width: 10),
            CardWidget(
                widget:
                    Center(child: Text('4K', style: TextStyles.lato400Size14)),
                radius: 6,
                width: 34.95,
                height: 26.55,
                color: CustomColors.rectangle)
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 20),
            CustomIcons.time,
            const SizedBox(width: 5),
            Text(runtime, style: TextStyles.decription),
            const SizedBox(width: 5),
            Text('minutes', style: TextStyles.decription),
            const SizedBox(width: 20),
            CustomIcons.starGrey,
            const SizedBox(width: 5),
            Text(voteAverage, style: TextStyles.decription),
            Text('(IMDb)', style: TextStyles.decription)
          ],
        ),
      ],
    );
  }
}
