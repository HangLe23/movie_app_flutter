import 'package:api/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_ui/index.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieBloc()..add(GetMovie(language: 'en-US', page: 1, region: '')),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          var bloc = context.read<MovieBloc>();

          switch (state.runtimeType) {
            case MovieInitial:
              return const Center(child: Text('Initial State'));
            case MovieError:
              return const SnackBar(
                  content: Text('No Data'), backgroundColor: Colors.red);
            case LoadMovie:
              Future.delayed(const Duration(milliseconds: 3000));
              return Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Image.asset(
                  'assets/images/load.gif',
                ),
              );
            case ListMovie:
              return SmartRefresher(
                controller: bloc.refreshController,
                enablePullUp: true,
                header: CustomHeader(
                  builder: (context, mode) {
                    return Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        'assets/images/load.gif',
                      ),
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
                  bloc.add(LoadMore(
                      language: 'en-US', region: '', page: state.page + 1));
                },
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 3000));
                  bloc.add(RefreshPage(
                      language: 'en-US', region: '', page: state.page));
                },
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: state.movies?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieItem(
                        imageUrl: state.movies?[index].posterPath ?? '',
                        name: state.movies?[index].title ?? '',
                        onTap: () async {
                          final detail = await DetailReponsitory(
                                  restApiClient: RestApiClient())
                              .getDetailMovie(
                                  movieId: state.movies?[index].id ?? 0,
                                  language: 'en-US');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(detail: detail),
                            ),
                          );
                        },
                        year: state.movies?[index].releaseDate ?? '');
                  },
                ),
              );
            default:
          }
          return const Center(child: Text('data'));
        },
      ),
    );
  }
}
