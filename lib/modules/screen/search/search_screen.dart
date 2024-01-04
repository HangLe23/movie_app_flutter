import 'package:api/index.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:shared_ui/index.dart';

class SearchResultScreen extends StatelessWidget {
  final ListResponse<MultipleMedia>? searchResults;
  const SearchResultScreen({Key? key, required this.searchResults})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchResults == null || searchResults!.list.isEmpty) {
      return const Center(
        child: Text('No results found'),
      );
    }

    // Filter the search results to only include "movie" and "tv" media types
    final filteredResults = searchResults!.list
        .where(
            (result) => result.mediaType == 'movie' || result.mediaType == 'tv')
        .toList();

    return Scaffold(
      backgroundColor: CustomColors.backgroudcolor,
      appBar: AppBar(
        title: Text(
          'Search Result',
          style: TextStyles.tittle,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20),
        child: ListView.separated(
          itemCount: filteredResults.length,
          itemBuilder: (context, index) {
            final result = filteredResults[index];
            return GestureDetector(
              onTap: () {
                NavigatorDetail(result, context);
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      height: 150.w,
                      width: 150.h,
                      child: result.posterPath == null ||
                              result.posterPath == 'null'
                          ? Image.asset('assets/images/themovie_app_icon.png')
                          : result.mediaType == 'movie' ||
                                  result.mediaType == 'tv'
                              ? InternetImage(
                                  imageUrl: result.posterPath ?? '',
                                )
                              : Container(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result.mediaType == 'movie'
                              ? result.title ?? ''
                              : result.name ?? '',
                          style: TextStyles.lato400Size19,
                        ),
                        SizedBox(height: 10.w),
                        Text(
                          result.mediaType == 'movie'
                              ? 'Release Date: ${result.releaseDate ?? ''}'
                              : 'First Air Date: ${result.firstAirDate ?? ''}',
                          style: TextStyles.lato400Size14,
                        ),
                        SizedBox(height: 10.w),
                        Text(
                          'Imdb: ${result.voteAverage}',
                          style: TextStyles.lato400Size14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 20.w);
          },
        ),
      ),
    );
  }
}

Future<void> NavigatorDetail(MultipleMedia media, BuildContext context) async {
  if (media.mediaType == 'movie') {
    final detail = await DetailReponsitory(restApiClient: RestApiClient())
        .getDetailMovie(movieId: media.id ?? 0, language: 'en-US');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailScreen(detail: detail),
      ),
    );
  } else if (media.mediaType == 'tv') {
    final detail = await DetailReponsitory(restApiClient: RestApiClient())
        .getDetailTvSeries(tvId: media.id ?? 0, language: 'en-US');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailTVScreen(detail: detail),
      ),
    );
  }
}
