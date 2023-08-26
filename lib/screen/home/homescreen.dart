import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/components/index.dart';
import 'package:movie_app_flutter/items/top_rate_item.dart';
import 'package:movie_app_flutter/screen/home/bloc/home_bloc.dart';
import 'package:movie_app_flutter/untils/Colors/colors.dart';
import 'package:movie_app_flutter/untils/Icons/icon_play.dart';
import 'package:movie_app_flutter/widget/cards.dart';

import '../../untils/TextStyles/TextStyles.dart';

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
            switch (state.runtimeType) {
              case HomeInitial:
                return Container(
                  child: const Text('Inittial State'),
                );
              case HomeError:
                return const SnackBar(
                    content: Text('Invalid'), backgroundColor: Colors.red);
              case ListTopRate:
                return Column(children: [
                  Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: InternetImage(
                        imageUrl: state.movies?.list[0].backdropPath ?? '',
                        width: 395,
                        height: 230,
                      ),
                    ),
                    Positioned(
                        left: 15,
                        bottom: 20,
                        child: CardWidget(
                            color: Colors.white30,
                            widget: Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                IconPlay(onTap: () {}),
                                const SizedBox(width: 20),
                                Text('Offical trailer',
                                    style: TextStyles.lato400Size19)
                              ],
                            ),
                            radius: 24,
                            width: 255,
                            height: 75))
                  ]),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: 350,
                      child: Text('Top rate', style: TextStyles.tittle)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: CarouselSlider.builder(
                      itemCount: state.movies?.list.length,
                      itemBuilder: (context, index, page) {
                        return TopRateItem(
                          imgURL: state.movies?.list[index].posterPath ?? '',
                          name: state.movies?.list[index].title ?? '',
                          imdb: state.movies?.list[index].voteAverage
                                  ?.toDouble() ??
                              0,
                          onTap: () {
                            // navigateToDetailScreen(
                            //     context, state.movies?.list[index].id ?? 0);
                          },
                        );
                      },
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 500,
                          viewportFraction: 0.7),
                    ),
                  )
                ]);
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

// void navigateToDetailScreen(BuildContext context, int movieId) async {
//   final detail = await MovieAPI().fetchMovieDetails(movieId);
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => DetailScreen(detail: detail),
//     ),
//   );
// }
