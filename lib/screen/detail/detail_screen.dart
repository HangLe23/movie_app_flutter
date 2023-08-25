import 'package:flutter/material.dart';
import 'package:movie_app_flutter/api_server/movie_api.dart';
import 'package:movie_app_flutter/components/catch_images/image_internet.dart';
import 'package:movie_app_flutter/items/cast_drew_item.dart';
import 'package:movie_app_flutter/models/cast_crew.dart';
import 'package:movie_app_flutter/models/detail.dart';
import 'package:movie_app_flutter/screen/cast_and_drew/cast_and_drew.dart';
import 'package:movie_app_flutter/untils/Icons/icon_play.dart';
import 'package:movie_app_flutter/untils/Icons/icons.dart';
import 'package:movie_app_flutter/widget/cards.dart';
import 'package:movie_app_flutter/widget/divider.dart';

import '../../untils/Colors/colors.dart';
import '../../untils/TextStyles/TextStyles.dart';

class DetailScreen extends StatefulWidget {
  final Detail detail;
  const DetailScreen({super.key, required this.detail});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      body: Column(children: [
        Stack(
          children: [
            widget.detail.backdropPath == 'https://image.tmdb.org/t/p/w500/null'
                ? const Icon(Icons.abc)
                : InternetImage(
                    imageUrl: widget.detail.backdropPath.toString()),
            Positioned(
                left: 20,
                top: 30,
                child: CardWidget(
                    color: Colors.white30,
                    widget: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    radius: 55,
                    width: 55,
                    height: 55)),
            Positioned(
                left: 175,
                top: 100,
                child: CardWidget(
                    widget: Center(
                        child: IconPlay(
                      onTap: () {},
                    )),
                    radius: 77,
                    width: 77,
                    height: 77,
                    color: Colors.white30))
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
                child: Text(widget.detail.title ?? '',
                    style: TextStyles.lato500Size28)),
            CardWidget(
                widget:
                    Center(child: Text('4K', style: TextStyles.lato400Size14)),
                radius: 6,
                width: 34.95,
                height: 26.55,
                color: CustomColors.rectangle)
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 20),
            CustomIcons.time,
            const SizedBox(width: 5),
            Text(widget.detail.runtime?.toString() ?? '',
                style: TextStyles.decription),
            const SizedBox(width: 5),
            Text('minutes', style: TextStyles.decription),
            const SizedBox(width: 20),
            CustomIcons.starGrey,
            const SizedBox(width: 5),
            Text(widget.detail.voteAverage?.toString() ?? '',
                style: TextStyles.decription),
            Text('(IMDb)', style: TextStyles.decription)
          ],
        ),
        DividerWidget(
            height: 1, width: double.infinity, color: CustomColors.lineWhite),
        Row(children: [
          const SizedBox(width: 20),
          Text('Release date', style: TextStyles.lato500Size19),
          const Spacer(),
          Text('Genre', style: TextStyles.lato500Size19),
          const SizedBox(width: 100)
        ]),
        Row(children: [
          const SizedBox(width: 20),
          Text(widget.detail.releaseDate ?? '', style: TextStyles.decription),
          const SizedBox(width: 120),
          CardWidget(
              widget: Center(
                child: Text(widget.detail.genres?[0].name.toString() ?? '',
                    style: TextStyles.decription),
              ),
              radius: 18,
              width: 72,
              height: 30,
              color: CustomColors.rectangle),
          const SizedBox(width: 5),
          CardWidget(
              widget: Center(
                child: Text(widget.detail.genres?[1].name.toString() ?? '',
                    style: TextStyles.decription),
              ),
              radius: 18,
              width: 72,
              height: 30,
              color: CustomColors.rectangle)
        ]),
        DividerWidget(
            height: 1, width: double.infinity, color: CustomColors.lineWhite),
        Row(children: [
          const SizedBox(width: 20),
          Text('Overview', style: TextStyles.lato500Size19)
        ]),
        const SizedBox(height: 5),
        Row(children: [
          const SizedBox(width: 20),
          Expanded(
              child: Text(widget.detail.overview ?? '',
                  style: TextStyles.decription, softWrap: true)),
        ]),
        Row(children: [
          const SizedBox(width: 20),
          Text('Cast & Crew', style: TextStyles.lato500Size19),
          const Spacer(),
          TextButton(
            onPressed: () async {
              final cast = await MovieAPI().fetchCastCrew(widget.detail.id!);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CastAndDrew(castCrew: cast),
                ),
              );
            },
            child: Text('More... ', style: TextStyles.decription),
          )
        ]),
        FutureBuilder(
          future: MovieAPI().getCastCrew(widget.detail.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final castCrewList = snapshot.data as List<CastCrew>;
              final castCrewWidgets = <Widget>[];
              for (var castCrew in castCrewList) {
                for (var castMember in castCrew.cast ?? []) {
                  castCrewWidgets.add(
                    Container(
                      height: 150,
                      width: 150,
                      padding: const EdgeInsets.only(left: 20),
                      child: CastDrewItem(
                        imageUrl: castMember.profilePath.toString(),
                        name: castMember.name.toString(),
                      ),
                    ),
                  );
                }
              }

              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return castCrewWidgets[index];
                  },
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        )
      ]),
    );
  }
}
