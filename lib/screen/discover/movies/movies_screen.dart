import 'package:flutter/material.dart';
import 'package:movie_app_flutter/api_server/movie_api.dart';
import 'package:movie_app_flutter/screen/detail/detail_screen.dart';

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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
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
                    onTap: () {
                      navigateToDetailScreen(
                          context, snapshot.data?[index].id ?? 0);
                    },
                    year: snapshot.data![index].releaseDate?.substring(0, 4) ??
                        '');
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        });
  }
}

void navigateToDetailScreen(BuildContext context, int movieId) async {
  final detail = await MovieAPI().fetchMovieDetails(movieId);
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => DetailScreen(detail: detail),
    ),
  );
}
