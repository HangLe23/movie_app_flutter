import 'package:flutter/material.dart';
import 'package:movie_app_flutter/untils/untils.dart';

class ReleaseDate extends StatelessWidget {
  final String releaseDate;
  const ReleaseDate({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Release date', style: TextStyles.lato500Size19),
        const SizedBox(height: 5),
        Text(releaseDate, style: TextStyles.decription),
      ],
    );
  }
}
