import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/screen/detail/detail_index.dart';
import 'package:movie_app_flutter/screen/detail/movie_detail/components/detail_components.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class DetailScreen extends StatefulWidget {
  final ObjectResponse<Detail> detail;
  const DetailScreen({super.key, required this.detail});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      body: BlocProvider(
        create: (context) => DetailBloc()
          ..add(GetDataDetail(
              language: 'en-US', movieId: widget.detail.object.id ?? 0)),
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
              case ListDataDetail:
                log(state.details?.object.id.toString() ?? '');
                return SingleChildScrollView(
                  child: Column(children: [
                    BannerDetail(
                        imgUrl: state.details?.object.backdropPath ?? ''),
                    const SizedBox(height: 20),
                    DetailTitle(
                        title: state.details?.object.title ?? '',
                        runtime: state.details?.object.runtime.toString() ?? '',
                        voteAverage:
                            state.details?.object.voteAverage.toString() ?? ''),
                    DividerWidget(
                        height: 1,
                        width: double.infinity,
                        color: CustomColors.lineWhite),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        ReleaseDate(
                            releaseDate:
                                state.details?.object.releaseDate ?? ''),
                        const SizedBox(width: 30),
                        DetailGenre(genre: state.details?.object.genres)
                      ],
                    ),
                    DividerWidget(
                        height: 1,
                        width: double.infinity,
                        color: CustomColors.lineWhite),
                    Overview(overview: state.details?.object.overview ?? ''),
                    ListCast(detail: widget.detail),
                    Recommendation(detail: widget.detail)
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
