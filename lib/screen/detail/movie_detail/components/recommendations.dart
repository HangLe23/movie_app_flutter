import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/responsitories/repository.dart';
import 'package:movie_app_flutter/screen/detail/detail_index.dart';
import 'package:movie_app_flutter/screen/discover/discover_index.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class Recommendation extends StatefulWidget {
  final ObjectResponse<Detail> detail;
  const Recommendation({super.key, required this.detail});

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc()
        ..add(GetRecommendation(
            language: 'en-US', page: 1, movieId: widget.detail.object.id ?? 0)),
      child: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
        switch (state.runtimeType) {
          case ListMovie:
            return Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text('Related Movies', style: TextStyles.lato500Size19),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      for (var movie in state.movies?.list ?? [])
                        Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: MovieItem(
                            imageUrl: movie?.posterPath ?? '',
                            name: movie?.title ?? '',
                            onTap: () async {
                              final detail = await DetailReponsitory(
                                      restApiClient: RestApiClient())
                                  .getDetailMovie(
                                      movieId: movie?.id ?? 0,
                                      language: 'en-US');
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(detail: detail),
                                ),
                              );
                            },
                            year: movie?.releaseDate ?? '',
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          default:
            return Container();
        }
      }),
    );
  }
}
