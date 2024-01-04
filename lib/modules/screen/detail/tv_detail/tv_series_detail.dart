import 'package:api/index.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

import 'components/index.dart';

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
                return SingleChildScrollView(
                  child: Column(children: [
                    BannerTvSeries(
                        imgUrl: state.detailTv?.object.backdropPath ?? ''),
                    SizedBox(height: 10.w),
                    DetailTitle(
                      title: state.detailTv?.object.originalName ?? '',
                      voteAverage:
                          state.detailTv?.object.voteAverage.toString() ?? '',
                    ),
                    DividerWidget(
                      height: 1.w,
                      color: CustomColors.lineWhite,
                      width: 300.h,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20.h),
                        ReleaseDate(
                          first: state.detailTv?.object.firstAirDate ?? '',
                          last: state.detailTv?.object.lastAirDate ?? '',
                        ),
                      ],
                    ),
                    DividerWidget(
                      height: 1.w,
                      color: CustomColors.lineWhite,
                      width: 300.h,
                    ),
                    DetailGenre(genre: state.detailTv?.object.genres),
                    DividerWidget(
                      height: 1.w,
                      color: CustomColors.lineWhite,
                      width: 300.h,
                    ),
                    Overview(overview: state.detailTv?.object.overview ?? ''),
                    SizedBox(height: 10.w),
                    ListSeason(
                      tvSeason: state.detailTv,
                      count: state.detailTv?.object.seasons?.length ?? 0,
                    ),
                    SizedBox(height: 10.w),
                    Recommendation(
                      tvseries: state.tvseries,
                      count: state.tvseries?.list.length ?? 0,
                    )
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
