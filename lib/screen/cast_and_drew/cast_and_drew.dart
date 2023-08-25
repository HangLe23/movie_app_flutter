import 'package:flutter/material.dart';
import 'package:movie_app_flutter/api_server/movie_api.dart';
import 'package:movie_app_flutter/items/cast_drew_item.dart';
import 'package:movie_app_flutter/models/cast_crew.dart';
import 'package:movie_app_flutter/widget/searchWidget.dart';

import '../../untils/Colors/colors.dart';
import '../../untils/TextStyles/TextStyles.dart';

class CastAndDrew extends StatefulWidget {
  final CastCrew castCrew;
  const CastAndDrew({super.key, required this.castCrew});

  @override
  State<CastAndDrew> createState() => _CastAndDrewState();
}

class _CastAndDrewState extends State<CastAndDrew> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF15141f),
        appBar: AppBar(
          title: Text(
            'Cast & Crew ',
            style: TextStyles.tittle,
          ),
          backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
          elevation: 0, // Xóa đổ bóng của AppBar
        ),
        body: Column(
          children: [
            SearchWidget(
                textedit: search,
                hint: 'Search',
                color: CustomColors.rectangle,
                function: (text) {}),
            FutureBuilder(
              future: MovieAPI().getCastCrew(widget.castCrew.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data != null) {
                  final castCrewList = snapshot.data as List<CastCrew>;
                  final List<Cast> castList = [];
                  final List<Crew> crewList = [];
                  for (var castCrew in castCrewList) {
                    castList.addAll(castCrew.cast ?? []);
                    crewList.addAll(castCrew.crew ?? []);
                  }
                  final castCrewWidgets = <Widget>[];
                  for (var castMember in castList) {
                    castCrewWidgets.add(
                      CastDrewItem(
                        imageUrl: castMember.profilePath ?? '',
                        name: castMember.name ?? '',
                      ),
                    );
                  }
                  for (var crewMember in crewList) {
                    castCrewWidgets.add(
                      CastDrewItem(
                        imageUrl: crewMember.profilePath ?? '',
                        name: crewMember.name ?? '',
                      ),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.55,
                      ),
                      itemCount: castCrewWidgets.length,
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
          ],
        ));
  }
}
