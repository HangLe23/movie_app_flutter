import 'dart:developer';

import 'package:api/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_ui/index.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home', style: TextStyles.tittle),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) =>
            HomeBloc()..add(GetTopRate(language: 'en-US', page: 1, region: '')),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            var bloc = context.read<HomeBloc>();
            switch (state.runtimeType) {
              case HomeInitial:
                return const Text('Inittial State');
              case HomeError:
                return const SnackBar(
                    content: Text('No Data'), backgroundColor: Colors.red);
              case LoadHome:
                return const Center(child: CircularProgressIndicator());
              case ListTopRate:
                return SmartRefresher(
                    controller: bloc.refreshController,
                    enablePullUp: true,
                    header: CustomHeader(
                      builder: (context, mode) {
                        return Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/load.gif'),
                        );
                      },
                    ),
                    footer: CustomFooter(
                      builder: (context, mode) {
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = Text(
                            "pull up load",
                            style: TextStyles.lato400Size14,
                          );
                        } else if (mode == LoadStatus.loading) {
                          body = const CircularProgressIndicator();
                        } else if (mode == LoadStatus.failed) {
                          body = Text(
                            "Load Failed!Click retry!",
                            style: TextStyles.lato400Size14,
                          );
                        } else if (mode == LoadStatus.canLoading) {
                          body = Text(
                            "release to load more",
                            style: TextStyles.lato400Size14,
                          );
                        } else {
                          body = const Text("No more Data");
                        }
                        return SizedBox(
                          height: 50.w,
                          child: Center(child: body),
                        );
                      },
                    ),
                    onLoading: () {
                      log(state.page.toString());
                      bloc.add(LoadMoreTopRate(
                          language: 'en-US', region: '', page: state.page + 1));
                    },
                    onRefresh: () {
                      bloc.add(RefreshTopRate(
                          language: 'en-US', region: '', page: state.page));
                    },
                    child: Column(
                      children: [
                        BannerHome(
                          imgUrl: state.movies?[0].backdropPath ?? '',
                          onTap: () async {
                            onGetVideoHome(
                              state.movies?[0].id ?? 0,
                            );
                          },
                        ),
                        SizedBox(height: 10.w),
                        SizedBox(
                          width: 300.h,
                          child: Text(
                            'Top rate',
                            style: TextStyles.tittle,
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Expanded(
                          child: CarouselSlider.builder(
                            itemCount: state.movies?.length,
                            itemBuilder: (context, index, page) {
                              return TopRateItem(
                                imgURL: state.movies?[index].posterPath ?? '',
                                name: state.movies?[index].title ?? '',
                                imdb: state.movies?[index].voteAverage
                                        ?.toDouble() ??
                                    0,
                                onTap: () {
                                  navigatorScreen(
                                      context, state.movies?[index].id ?? 0);
                                },
                              );
                            },
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              height: 400.w,
                              viewportFraction: 0.5.h,
                            ),
                          ),
                        ),
                      ],
                    ));
              default:
            }
            return const Scaffold(
              body: Text('data'),
            );
          },
        ),
      ),
    );
  }
}

void navigatorScreen(BuildContext context, int id) async {
  final detail = await DetailReponsitory(restApiClient: RestApiClient())
      .getDetailMovie(movieId: id, language: 'en-US');
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => DetailScreen(detail: detail),
    ),
  );
}

Future<void> onGetVideoHome(int id) async {
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
