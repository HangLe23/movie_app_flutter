import 'dart:developer';

import 'package:api/index.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'components/index.dart';

class DetailScreen extends StatefulWidget {
  final ObjectResponse<Detail> detail;
  const DetailScreen({super.key, required this.detail});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://flutter.dev'));
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
                      imgUrl: state.details?.object.backdropPath ?? '',
                      onTap: () async {
                        onGetVideo(state.details?.object.id ?? 0);
                      },
                    ),
                    SizedBox(height: 10.w),
                    DetailTitle(
                        title: state.details?.object.title ?? '',
                        runtime: state.details?.object.runtime.toString() ?? '',
                        voteAverage:
                            state.details?.object.voteAverage.toString() ?? ''),
                    DividerWidget(
                      height: 1.w,
                      color: CustomColors.lineWhite,
                      width: 300.h,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20.h),
                        ReleaseDate(
                            releaseDate:
                                state.details?.object.releaseDate ?? ''),
                        SizedBox(width: 30.h),
                        DetailGenre(genre: state.details?.object.genres)
                      ],
                    ),
                    DividerWidget(
                      height: 1.w,
                      color: CustomColors.lineWhite,
                      width: 300.h,
                    ),
                    Overview(overview: state.details?.object.overview ?? ''),
                    ListCast(
                      id: state.castMovieData?.object.id ?? 0,
                      casts: state.castMovieData,
                    ),
                    SizedBox(height: 10.w),
                    Recommendation(
                      count: state.movie?.list.length ?? 0,
                      movie: state.movie,
                    )
                  ]),
                );
              default:
            }
            return Center(
              child: Text('No data available', style: TextStyles.lato400Size19),
            );
          },
        ),
      ),
    );
  }
}

Future<void> onGetVideo(int id) async {
  try {
    final videosResponse = await VideoRepository(
      restApiClient: RestApiClient(),
    ).getVideoMovie(
      language: 'en-US',
      movieId: id,
    );

    final videos = videosResponse.list;
    final trailer = videos.firstWhere((video) => video.type == 'Trailer');
    final Uri url = Uri.parse('https://www.youtube.com/watch?v=${trailer.key}');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch ');
    }
  } catch (e) {
    log(e.toString());
  }
}
