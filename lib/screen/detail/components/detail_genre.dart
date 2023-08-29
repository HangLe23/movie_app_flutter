import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class DetailGenre extends StatelessWidget {
  final List<Genre>? genre;
  const DetailGenre({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Genre', style: TextStyles.lato500Size19),
          const SizedBox(height: 5),
          GenreListWidget(genres: genre),
        ],
      ),
    );
  }
}
