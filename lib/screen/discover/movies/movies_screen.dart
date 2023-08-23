import 'package:flutter/material.dart';
import 'package:movie_app_flutter/api_server/movie_api.dart';

import '../../../items/movie_item.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MovieAPI().getMovies(),
        builder: (context, snapshot) {
          return GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.55,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return MovieItem(
                imageUrl: snapshot.data?[index].posterPath ?? '',
                name: snapshot.data?[index].title ?? '',
              );
            },
          );
        });
  }
}
