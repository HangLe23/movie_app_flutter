import 'package:flutter/material.dart';

import '../items/cast_drew_item.dart';
import '../items/movie_item.dart';
import '../untils/TextStyles/TextStyles.dart';

class MockData {
  List<MovieItem> movieItems = [
    const MovieItem(
      imageUrl: 'assets/images/Soul.png',
      name: 'Soul (2020)',
    ),
    const MovieItem(
      imageUrl: 'assets/images/KnivesOut.png',
      name: 'Knives Out (2019)',
    ),
    const MovieItem(
      imageUrl: 'assets/images/Onward.png',
      name: 'Onward (2020)',
    ),
    const MovieItem(
      imageUrl: 'assets/images/JohnLeguizamo.png',
      name: 'Mulan (2020)',
    ),
    const MovieItem(
      imageUrl: 'assets/images/HarleyQuinn.png',
      name: 'Birds of Prey (2020)',
    ),
    const MovieItem(
      imageUrl: 'assets/images/movies.png',
      name: 'Now You See Me 2 (2016)',
    ),
    const MovieItem(
      imageUrl: 'assets/images/EnolaHolmes.png',
      name: 'Enola Holmes (2020)',
    ),
    const MovieItem(
      imageUrl: 'assets/images/ReadyPlayerOne.png',
      name: 'Ready Player One (2018)',
    )
  ];
  List<CastDrewItem> castDrewItem = [
    const CastDrewItem(
      imageUrl: 'assets/images/JohnLeguizamo.png',
      name: 'John Leguizamo',
    ),
    const CastDrewItem(
      imageUrl: 'assets/images/JohnLeguizamo.png',
      name: 'John Leguizamo',
    ),
    const CastDrewItem(
      imageUrl: 'assets/images/JohnLeguizamo.png',
      name: 'John Leguizamo',
    ),
    const CastDrewItem(
      imageUrl: 'assets/images/JohnLeguizamo.png',
      name: 'John Leguizamo',
    ),
    const CastDrewItem(
      imageUrl: 'assets/images/JohnLeguizamo.png',
      name: 'John Leguizamo',
    ),
    const CastDrewItem(
      imageUrl: 'assets/images/JohnLeguizamo.png',
      name: 'John Leguizamo',
    ),
    const CastDrewItem(
      imageUrl: 'assets/images/JohnLeguizamo.png',
      name: 'John Leguizamo',
    ),
    const CastDrewItem(
      imageUrl: 'assets/images/JohnLeguizamo.png',
      name: 'John Leguizamo',
    ),
  ];
  List<Widget> tabs = [
    Text('Movies', style: TextStyles.tab),
    Text('TV series', style: TextStyles.tab),
    Text('Documentary', style: TextStyles.tab),
    Text('Sports', style: TextStyles.tab),
  ];
}
