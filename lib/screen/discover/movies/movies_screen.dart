import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/responsitories/detail_reponsitories/detail_reponsitory.dart';
import 'package:movie_app_flutter/screen/detail/detail_screen.dart';
import 'package:movie_app_flutter/screen/discover/movies/bloc/movie_bloc.dart';
import 'package:movie_app_flutter/widget/items/movie_item.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieBloc()..add(GetMovie(language: 'en-US', page: 1, region: '')),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case MovieInitial:
              return const Center(child: Text('Initial State'));
            case MovieError:
              return const SnackBar(
                  content: Text('No Data'), backgroundColor: Colors.red);
            case LoadMovie:
              return const Center(child: CircularProgressIndicator());
            case ListMovie:
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.54,
                ),
                itemCount: state.movies?.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieItem(
                      imageUrl: state.movies?.list[index].posterPath ?? '',
                      name: state.movies?.list[index].title ?? '',
                      onTap: () async {
                        final detail = await DetailReponsitory(
                                restApiClient: RestApiClient())
                            .getDetail(
                                movieId: state.movies?.list[index].id ?? 0,
                                language: 'en-US');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(detail: detail),
                          ),
                        );
                      },
                      year: state.movies?.list[index].releaseDate ?? '');
                },
              );
            default:
          }
          return const Center(child: Text('data'));
        },
      ),
    );
  }
}
