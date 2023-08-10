import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/mock_data/mock_data.dart';
import 'package:movie_app_flutter/screen/discover/documentary/documentary_screen.dart';
import 'package:movie_app_flutter/screen/discover/movies/movies_screen.dart';
import 'package:movie_app_flutter/screen/discover/sports/sport_screen.dart';
import 'package:movie_app_flutter/screen/discover/tv%20series/tvSeries_screen.dart';
import 'package:movie_app_flutter/untils/TextStyles/TextStyles.dart';

import '../../untils/Colors/colors.dart';
import '../../widget/searchWidget.dart';
import 'bloc/discover_bloc.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverBloc(),
      child: Scaffold(
        backgroundColor: CustomColors.backgroudcolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 130,
          flexibleSpace: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                width: 375,
                child: Text(
                  'Find Movies, Tv series, and more..',
                  style: TextStyles.tittle,
                  textAlign: TextAlign.left,
                ),
              ),
              SearchWidget(
                textedit: TextEditingController(),
                hint: 'Search',
                color: CustomColors.rectangle,
                function: (text) {},
              ),
            ],
          ),
        ),
        body: BlocConsumer<DiscoverBloc, DiscoverState>(
          listener: (context, state) {},
          builder: (context, state) {
            return DefaultTabController(
              initialIndex: 0,
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    labelColor: CustomColors.gradientbg,
                    unselectedLabelColor: CustomColors.lineWhite,
                    indicatorColor: CustomColors.gradientbg,
                    tabs: MockData().tabs,
                    onTap: (value) {
                      BlocProvider.of<DiscoverBloc>(context)
                          .add(TabChange(index: value));
                    },
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        MovieScreen(),
                        TVSeriesScreen(),
                        DocumentaryScreen(),
                        SportScreen()
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
