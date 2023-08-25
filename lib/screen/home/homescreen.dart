import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/api_server/movie_api.dart';
import 'package:movie_app_flutter/items/top_rate_item.dart';
import 'package:movie_app_flutter/screen/detail/detail_screen.dart';
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
      body: Column(
        children: [
          Stack(children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Image.asset('assets/images/banner.png',
                    width: 395, height: 230),
              ),
            ),
            Positioned(
                left: 20,
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
                        Text('Offical trailer', style: TextStyles.lato400Size19)
                      ],
                    ),
                    radius: 24,
                    width: 255,
                    height: 75))
          ]),
          SizedBox(
            width: 350,
            child: Text('Top rate', style: TextStyles.tittle),
          ),
          FutureBuilder(
              future: MovieAPI().getTopRates(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: CarouselSlider.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index, page) {
                        return TopRateItem(
                          imgURL: snapshot.data?[index].posterPath ?? '',
                          name: snapshot.data?[index].title ?? '',
                          imdb: snapshot.data![index].voteAverage?.toDouble() ??
                              0,
                          onTap: () {
                            navigateToDetailScreen(
                                context, snapshot.data?[index].id ?? 0);
                          },
                        );
                      },
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 500,
                          viewportFraction: 0.7),
                    ),
                  );
                } else {
                  return const Text('No data available');
                }
              })
        ],
      ),
    );
  }
}

void navigateToDetailScreen(BuildContext context, int movieId) async {
  final detail = await MovieAPI().fetchMovieDetails(movieId);
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => DetailScreen(detail: detail),
    ),
  );
}
