import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/api/apis/api_client/index.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/screen/detail/detail_index.dart';
import 'package:movie_app_flutter/screen/detail/tv_detail/components/detail_components.dart';
import 'package:movie_app_flutter/screen/detail/tv_detail/components/list_tv_season.dart';
import 'package:movie_app_flutter/screen/detail/tv_detail/components/recommendations.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class DetailTVScreen extends StatefulWidget {
  final ObjectResponse<DetailTvSeries> detail;
  const DetailTVScreen({super.key, required this.detail});

  @override
  State<DetailTVScreen> createState() => _DetailTVScreenState();
}

class _DetailTVScreenState extends State<DetailTVScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      body: BlocProvider(
        create: (context) => DetailBloc()
          ..add(GetDataDetailTv(
              language: 'en-US', tvId: widget.detail.object.id ?? 0)),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case DetailInitial:
                return const Center(
                  child: Text('Inittial State'),
                );
              case DetailError:
                return const SnackBar(
                    content: Text('No data error'),
                    backgroundColor: Colors.red);
              case LoadDetail:
                return const Center(child: CircularProgressIndicator());
              case ListDataDetailTv:
                log(state.detailTv?.object.id.toString() ?? '');
                return SingleChildScrollView(
                  child: Column(children: [
                    BannerTvSeries(
                        imgUrl: state.detailTv?.object.backdropPath ?? ''),
                    const SizedBox(height: 20),
                    DetailTitle(
                        title: state.detailTv?.object.originalName ?? '',
                        voteAverage:
                            state.detailTv?.object.voteAverage.toString() ??
                                ''),
                    DividerWidget(
                        height: 1,
                        width: double.infinity,
                        color: CustomColors.lineWhite),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        ReleaseDate(
                          first: state.detailTv?.object.firstAirDate ?? '',
                          last: state.detailTv?.object.lastAirDate ?? '',
                        ),
                      ],
                    ),
                    DividerWidget(
                        height: 1,
                        width: double.infinity,
                        color: CustomColors.lineWhite),
                    DetailGenre(genre: state.detailTv?.object.genres),
                    DividerWidget(
                        height: 1,
                        width: double.infinity,
                        color: CustomColors.lineWhite),
                    Overview(overview: state.detailTv?.object.overview ?? ''),
                    const SizedBox(height: 10),
                    ListSeason(tvSeason: state.detailTv?.object.seasons),
                    const SizedBox(height: 10),
                    Recommendation(id: widget.detail.object.id ?? 0)
                  ]),
                );
              default:
            }
            return const Center(
              child: Text('No data available'),
            );
          },
        ),
      ),
    );
  }
}
