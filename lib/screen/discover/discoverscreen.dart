import 'package:flutter/material.dart';
import 'package:movie_app_flutter/untils/TextStyles/TextStyles.dart';
import 'package:movie_app_flutter/widget/searchWidget.dart';

import '../../untils/Colors/colors.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('Find Movies, Tv series, and more..', style: TextStyles.tittle),
          SearchWidget(
              textedit: TextEditingController(),
              hint: 'Search',
              color: CustomColors.rectangle,
              function: (text) {}),
          DefaultTabController(
            length: 2,
            child: TabBar(
              tabs: [
                Tab(
                  child: Text('Movies', style: TextStyles.lato400Size19),
                ),
                Tab(
                  child: Text('TV series', style: TextStyles.lato400Size19),
                ),
              ],
            ),
          ),
          TabBarView(
            children: [
              // Nội dung tương ứng với tab 'Movies'
              Center(
                  child:
                      Text('Movies Content', style: TextStyles.lato400Size19)),
              // Nội dung tương ứng với tab 'TV Series'
              Center(
                  child: Text('TV Series Content',
                      style: TextStyles.lato400Size19)),
            ],
          ),
        ],
      ),
    );
  }
}
