import 'package:api/index.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

class ListCast extends StatelessWidget {
  final int id;
  final ObjectResponse<CastCrew>? casts;
  const ListCast({
    Key? key,
    required this.casts,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20.h),
            Text('Cast', style: TextStyles.lato500Size19),
            const Spacer(),
            TextButton(
              onPressed: () async {
                final casts =
                    await CreditRepository(restApiClient: RestApiClient())
                        .getCastCrew(movieId: id, language: 'en-US');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CastAndDrew(castCrew: casts),
                  ),
                );
              },
              child: Text('More... ', style: TextStyles.decription),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 225.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 120.h,
                child: CastDrewItem(
                  imageUrl: casts?.object.cast?[index].profilePath ?? '',
                  name: casts?.object.cast?[index].name ?? '',
                ),
              );
            },
          ),
        ),
        Row(
          children: [
            SizedBox(width: 20.h),
            Text('Drew', style: TextStyles.lato500Size19),
            const Spacer(),
            TextButton(
              onPressed: () async {
                final casts =
                    await CreditRepository(restApiClient: RestApiClient())
                        .getCastCrew(movieId: id, language: 'en-US');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CastAndDrew(castCrew: casts),
                  ),
                );
              },
              child: Text('More... ', style: TextStyles.decription),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 225.w,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 120.h,
                child: CastDrewItem(
                  imageUrl: casts?.object.crew?[index].profilePath ?? '',
                  name: casts?.object.crew?[index].name ?? '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
