import 'package:api/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_ui/index.dart';

import 'bloc/tv_series_bloc.dart';

class TvSeriesScreen extends StatefulWidget {
  const TvSeriesScreen({super.key});

  @override
  State<TvSeriesScreen> createState() => _TvSeriesScreenState();
}

class _TvSeriesScreenState extends State<TvSeriesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TvSeriesBloc()..add(GetTvSeries(language: 'en-US', page: 1)),
      child:
          BlocBuilder<TvSeriesBloc, TvSeriesState>(builder: (context, state) {
        var bloc = context.read<TvSeriesBloc>();
        switch (state.runtimeType) {
          case TvSeriesInitial:
            return const Center(child: Text('Initial State'));
          case TvSeriesError:
            return const SnackBar(
              content: Text('No data'),
              backgroundColor: Colors.red,
            );
          case LoadTvSeries:
            Future.delayed(const Duration(milliseconds: 3000));
            return Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Image.asset(
                'assets/images/load.gif',
              ),
            );

          case ListTvSeries:
            return SmartRefresher(
              controller: bloc.refreshController,
              enablePullDown: true,
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
                bloc.add(LoadMoreTV(
                    language: 'en-US', region: '', page: state.page + 1));
              },
              onRefresh: () {
                bloc.add(RefreshPageTV(
                    language: 'en-US', region: '', page: state.page));
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: state.tvseries?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.54,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MovieItem(
                    imageUrl: state.tvseries?[index].posterPath ?? '',
                    name: state.tvseries?[index].name ?? '',
                    onTap: () async {
                      final detail = await DetailReponsitory(
                              restApiClient: RestApiClient())
                          .getDetailTvSeries(
                              tvId: state.tvseries?[index].id ?? 0,
                              language: 'en-US');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailTVScreen(
                            detail: detail,
                          ),
                        ),
                      );
                    },
                    year: state.tvseries?[index].firstAirDate ?? '',
                  );
                },
              ),
            );
          default:
        }
        return const Center(child: Text('data'));
      }),
    );
  }
}
