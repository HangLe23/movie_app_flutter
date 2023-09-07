import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/responsitories/repository.dart';
import 'package:movie_app_flutter/screen/detail/detail_index.dart';
import 'package:movie_app_flutter/screen/discover/tv%20series/bloc/tv_series_bloc.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class Recommendation extends StatelessWidget {
  final int id;
  const Recommendation({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TvSeriesBloc()
        ..add(GetRecommendation(language: 'en-US', page: 1, tvId: id)),
      child: BlocBuilder<TvSeriesBloc, TvSeriesState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(children: [
                const SizedBox(width: 20),
                Text('Related TV Series', style: TextStyles.lato500Size19),
              ]),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    for (var movie in state.tvseries?.list ?? [])
                      Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: MovieItem(
                          imageUrl: movie?.posterPath ?? '',
                          name: movie?.originalName ?? '',
                          onTap: () async {
                            final detail = await DetailReponsitory(
                                    restApiClient: RestApiClient())
                                .getDetailTvSeries(
                                    tvId: movie?.id ?? 0, language: 'en-US');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailTVScreen(detail: detail),
                              ),
                            );
                          },
                          year: movie?.firstAirDate ?? '',
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
