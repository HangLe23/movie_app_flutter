import 'package:flutter/material.dart';
import 'package:movie_app_flutter/components/index.dart';
import 'package:movie_app_flutter/untils/untils.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String year;
  final Function() onTap;

  const MovieItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.onTap,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: imageUrl.isEmpty || imageUrl == 'null'
              ? SizedBox(
                  height: 270,
                  child: Image.asset('assets/images/themovie_app_icon.png'))
              : InternetImage(imageUrl: imageUrl),
        ),
        const SizedBox(height: 10),
        year.isEmpty || year == 'null' || year == ''
            ? Text('$name (yyyy)',
                style: TextStyles.lato400Size14, textAlign: TextAlign.left)
            : Text('$name (${year.substring(0, 4)})',
                style: TextStyles.lato400Size14, textAlign: TextAlign.left),
      ]),
    );
  }
}
