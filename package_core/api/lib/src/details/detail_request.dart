import 'package:api/index.dart';

class DetailRequest {
  DetailRequest._();
  static APIRequest getDetailMovie({
    required String language,
    required int movieId,
    String? appendToResponse,
  }) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/movie/$movieId',
        parameters: {
          'language': language,
          'movie_id': movieId,
          'append_to_response': appendToResponse,
        },
      );
  static APIRequest getDetailTvSeries({
    required String language,
    required int tvId,
    String? appendToResponse,
  }) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/tv/$tvId',
        parameters: {
          'language': language,
          'series_id': tvId,
          'append_to_response': appendToResponse,
        },
      );
  static APIRequest getTvSeason({
    required String language,
    required int tvId,
    required int season,
    String? appendToResponse,
  }) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/tv/$tvId/season/$season',
        parameters: {
          'language': language,
          'series_id': tvId,
          'season_number': season,
          'append_to_response': appendToResponse,
        },
      );
}
