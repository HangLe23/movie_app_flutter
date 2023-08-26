import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screen/list_movie/bloc/list_movie_bloc.dart';

import '../../items/movie_item.dart';

class ListMovie extends StatelessWidget {
  const ListMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => ListMovieBloc()
            ..add(GetData(language: 'en-US', page: 1, region: '')),
          child: BlocBuilder<ListMovieBloc, ListMovieState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case ListMovieInitial:
                  return Container(
                    child: const Text('Inittial State'),
                  );
                case ListError:
                  return Text('Error State ${state.error}');
                case ListData:
                  return ListView.builder(
                    itemCount: state.movies?.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MovieItem(
                          imageUrl: state.movies?.list[index].posterPath ?? '',
                          name: state.movies?.list[index].title ?? '',
                          onTap: () {},
                          year: state.movies?.list[index].releaseDate
                                  ?.substring(0, 4) ??
                              '');
                    },
                  );
                default:
              }
              return const Scaffold(
                body: Text('data'),
              );
            },
          ),
        ),
      ),
    );
  }
}
