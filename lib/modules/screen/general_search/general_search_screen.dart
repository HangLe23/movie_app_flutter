import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:movie_app_flutter/modules/screen/search/search_screen.dart';
import 'package:shared_ui/index.dart';

class GeneralSearchScreen extends StatelessWidget {
  const GeneralSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverBloc()..add(TabChange(index: 0)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: CustomColors.backgroudcolor,
          body: BlocBuilder<DiscoverBloc, DiscoverState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case ChangeTab:
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20.h),
                            Expanded(
                              child: Text(
                                'Find Movies, TV series, and more..',
                                style: TextStyles.tittle,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SearchWidget(
                          textedit: TextEditingController(),
                          hint: 'Search',
                          color: CustomColors.rectangle,
                          function: (query) {
                            context
                                .read<DiscoverBloc>()
                                .add(TextChange(text: query));
                          },
                        ),
                        DefaultTabController(
                          initialIndex: state.index ?? 0,
                          length: 4,
                          child: TabBar(
                            isScrollable: true,
                            labelColor: CustomColors.gradientbg,
                            unselectedLabelColor: CustomColors.lineWhite,
                            indicatorColor: CustomColors.gradientbg,
                            tabs: [
                              Text('Movies', style: TextStyles.tab),
                              Text('TV series', style: TextStyles.tab),
                              Text('Documentary', style: TextStyles.tab),
                              Text('Sports', style: TextStyles.tab),
                            ],
                            onTap: (value) {
                              BlocProvider.of<DiscoverBloc>(context)
                                  .add(TabChange(index: value));
                            },
                          ),
                        ),
                        Expanded(
                          child: IndexedStack(
                            index: state.index,
                            children: const [
                              MovieScreen(),
                              TvSeriesScreen(),
                              DocumentaryScreen(),
                              SportScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                case SearchResult:
                  return SearchResultScreen(searchResults: state.result);

                default:
              }
              return Center(
                child: Text(
                  'No data',
                  style: TextStyles.lato400Size19,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
