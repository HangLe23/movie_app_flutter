import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/screen/discover/discover_index.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

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
                  const SizedBox(height: 10),
                  TabBar(
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
