import 'package:api/index.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class ListSeason extends StatelessWidget {
  final ObjectResponse<DetailTvSeries>? tvSeason;
  final int count;
  const ListSeason({
    super.key,
    required this.tvSeason,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          SizedBox(width: 20.h),
          Text('Session', style: TextStyles.lato500Size19),
        ]),
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 300.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.h);
            },
            itemCount: count,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 150.h,
                child: MovieItem(
                  imageUrl: tvSeason?.object.seasons![index].posterPath ?? '',
                  name: tvSeason?.object.seasons![index].name ?? '',
                  onTap: () {},
                  year: tvSeason?.object.seasons![index].airDate ?? '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
