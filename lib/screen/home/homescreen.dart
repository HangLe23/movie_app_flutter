import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/responsitories/repository.dart';
import 'package:movie_app_flutter/screen/detail/detail_index.dart';
import 'package:movie_app_flutter/screen/home/home_index.dart';
import 'package:movie_app_flutter/untils/untils.dart';

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
                    content: Text('No Data'), backgroundColor: Colors.red);
              case LoadHome:
                return const Center(child: CircularProgressIndicator());
              case ListTopRate:
                return Column(children: [
                  BannerHome(imgUrl: state.movies?.list[0].backdropPath ?? ''),
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
                          onTap: () async {
                            final detail = await DetailReponsitory(
                                    restApiClient: RestApiClient())
                                .getDetailMovie(
                                    movieId: state.movies?.list[index].id ?? 0,
                                    language: 'en-US');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(detail: detail),
                              ),
                            );
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
