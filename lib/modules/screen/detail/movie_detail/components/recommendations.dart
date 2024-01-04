import 'package:api/index.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

class Recommendation extends StatelessWidget {
  final ListResponse<MovieModel>? movie;
  final int count;
  const Recommendation({Key? key, required this.movie, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          SizedBox(width: 20.h),
          Text('Related Movies', style: TextStyles.lato500Size19),
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
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 120.h,
                  child: MovieItem(
                    imageUrl: movie?.list[index].posterPath ?? '',
                    name: movie?.list[index].title ?? '',
                    onTap: () async {
                      final detail = await DetailReponsitory(
                              restApiClient: RestApiClient())
                          .getDetailMovie(
                              movieId: movie?.list[index].id ?? 0,
                              language: 'en-US');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(detail: detail),
                        ),
                      );
                    },
                    year: movie?.list[index].releaseDate ?? '',
                  ),
                );
              },
            )),
      ],
    );
  }
}
