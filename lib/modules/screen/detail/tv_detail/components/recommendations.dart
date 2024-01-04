import 'package:api/index.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

class Recommendation extends StatelessWidget {
  final ListResponse<TvSeriesModel>? tvseries;
  final int count;
  const Recommendation({
    super.key,
    required this.tvseries,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          SizedBox(width: 20.h),
          Text('Related TV Series', style: TextStyles.lato500Size19),
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
                  imageUrl: tvseries?.list[index].posterPath ?? '',
                  name: tvseries?.list[index].name ?? '',
                  onTap: () async {
                    final detail =
                        await DetailReponsitory(restApiClient: RestApiClient())
                            .getDetailTvSeries(
                                tvId: tvseries?.list[index].id ?? 0,
                                language: 'en-US');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailTVScreen(
                          detail: detail,
                        ),
                      ),
                    );
                  },
                  year: tvseries?.list[index].firstAirDate ?? '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
