import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/items/item.dart';

class ListSeason extends StatelessWidget {
  final List<TvSeasonDetail>? tvSeason;
  const ListSeason({
    super.key,
    required this.tvSeason,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          const SizedBox(width: 20),
          Text('Session', style: TextStyles.lato500Size19),
        ]),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 10),
              for (final movie in tvSeason!.toList())
                Container(
                  width: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MovieItem(
                    imageUrl: movie.posterPath ?? '',
                    name: movie.name ?? '',
                    onTap: () {},
                    year: movie.airDate ?? '',
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
