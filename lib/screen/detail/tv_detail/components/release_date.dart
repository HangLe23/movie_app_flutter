import 'package:flutter/material.dart';
import 'package:movie_app_flutter/untils/untils.dart';

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
            const SizedBox(height: 5),
            Text(first, style: TextStyles.decription),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Last air date', style: TextStyles.lato500Size19),
            const SizedBox(height: 5),
            Text(last, style: TextStyles.decription),
          ],
        ),
      ],
    );
  }
}
