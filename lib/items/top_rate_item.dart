import 'package:flutter/material.dart';
import 'package:movie_app_flutter/untils/Icons/icons.dart';
import 'package:movie_app_flutter/widget/cards.dart';

import '../untils/TextStyles/TextStyles.dart';

class TopRateItem extends StatelessWidget {
  final String imgURL;
  final String name;
  final double imdb;
  final Function() onTap;
  const TopRateItem(
      {super.key,
      required this.imgURL,
      required this.name,
      required this.imdb,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: Image.network(imgURL),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.05,
              bottom: 30,
              child: CardWidget(
                  color: Colors.white30,
                  widget: Center(
                      child: Text(
                    name,
                    style: TextStyles.lato400Size19,
                  )),
                  radius: 24,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.08)),
          Positioned(
              top: 15,
              right: 15,
              child: CardWidget(
                  color: Colors.white30,
                  widget: Column(
                    children: [
                      const SizedBox(height: 5),
                      Text('IMDb', style: TextStyles.IMDb),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const SizedBox(width: 15),
                          CustomIcons.star,
                          const SizedBox(width: 5),
                          Text(imdb.toString(), style: TextStyles.lato400Size19)
                        ],
                      )
                    ],
                  ),
                  radius: 18,
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: MediaQuery.of(context).size.height * 0.055))
        ],
      ),
    );
  }
}
