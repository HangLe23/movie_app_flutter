import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/responsitories/repository.dart';
import 'package:movie_app_flutter/screen/detail/detail_index.dart';
import 'package:movie_app_flutter/screen/discover/tv%20series/bloc/tv_series_bloc.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class TvSeriesScreen extends StatefulWidget {
  const TvSeriesScreen({super.key});

  @override
  State<TvSeriesScreen> createState() => _TvSeriesScreenState();
}

class _TvSeriesScreenState extends State<TvSeriesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TvSeriesBloc()..add(GetTvSeries(language: 'en-US', page: 1)),
      child:
          //  BlocBuilder<TvSeriesBloc, TvSeriesState>(
          //   builder: (context, state) {
          //     switch (state.runtimeType) {
          //       case TvSeriesError:
          //         return const Text(
          //           'error',
          //           style: TextStyle(color: Colors.amber),
          //         );
          //       case LoadTvSeries:
          //         return const Text(
          //           'has data',
          //           style: TextStyle(color: Colors.amber),
          //         );
          //     }
          //     return const Text(
          //       'a',
          //       style: TextStyle(color: Colors.amber),
          //     );
          //   },
          // ),

          BlocBuilder<TvSeriesBloc, TvSeriesState>(builder: (context, state) {
        switch (state.runtimeType) {
          case TvSeriesInitial:
            return const Center(child: Text('Initial State'));
          case TvSeriesError:
            return const SnackBar(
              content: Text('No data'),
              backgroundColor: Colors.red,
            );
          case LoadTvSeries:
            return const Center(child: CircularProgressIndicator());
          case ListTvSeries:
            return GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.tvseries?.list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 0.54,
              ),
              itemBuilder: (BuildContext context, int index) {
                log(state.tvseries?.list[index].id.toString() ?? '');
                return MovieItem(
                  imageUrl: state.tvseries?.list[index].posterPath ?? '',
                  name: state.tvseries?.list[index].name ?? '',
                  onTap: () async {
                    final detail =
                        await DetailReponsitory(restApiClient: RestApiClient())
                            .getDetail(
                                movieId: state.tvseries?.list[index].id ?? 0,
                                language: 'en-US');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(detail: detail),
                      ),
                    );
                  },
                  year: state.tvseries?.list[index].firstAirDate ?? '',
                );
              },
            );
          default:
        }
        return const Center(child: Text('data'));
      }),
    );
  }
}
