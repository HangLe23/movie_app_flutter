import 'package:flutter/material.dart';
import 'package:movie_app_flutter/mock_data/mock_data.dart';
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
        title: Text(
          'Home',
          style: TextStyles.tittle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Image.asset(
                  'assets/images/banner.png',
                  width: 395,
                  height: 230,
                ),
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
                      IconPlay(
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Offical trailer',
                        style: TextStyles.lato400Size19,
                      ),
                    ],
                  ),
                  radius: 24,
                  width: 255,
                  height: 75),
            )
          ]),
          SizedBox(
            width: 350,
            child: Text(
              'Top rate',
              style: TextStyles.tittle,
            ),
          ),
          Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.all(20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        height: 230, child: MockData().TopRateImages[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        width: 15,
                      ),
                  itemCount: MockData().TopRateImages.length))
        ],
      ),
    );
  }
}
