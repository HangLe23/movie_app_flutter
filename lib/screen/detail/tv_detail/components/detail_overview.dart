import 'package:flutter/material.dart';
import 'package:movie_app_flutter/untils/untils.dart';

class Overview extends StatelessWidget {
  final String overview;
  const Overview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          const SizedBox(width: 20),
          Text('Overview', style: TextStyles.lato500Size19)
        ]),
        const SizedBox(height: 5),
        Row(children: [
          const SizedBox(width: 20),
          overview == 'null' || overview == ''
              ? Text('No overview', style: TextStyles.decription)
              : Expanded(
                  child: Text(overview,
                      style: TextStyles.decription, softWrap: true)),
        ]),
      ],
    );
  }
}
