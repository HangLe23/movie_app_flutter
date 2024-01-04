import '../../apis/api.dart';

class TvSeriesRequest {
  TvSeriesRequest._();
  static APIRequest getAiringToday({
    required String language,
    required int page,
    required String timezone,
  }) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/tv/airing_today',
        parameters: {
          'language': language,
          'page': page,
          'timezone': timezone,
        },
      );
  static APIRequest getOnTheAir({
    required String language,
    required int page,
    required String timezone,
  }) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/tv/on_the_air',
        parameters: {
          'language': language,
          'page': page,
          'timezone': timezone,
        },
      );
  static APIRequest getPoplarTV({
    required String language,
    required int page,
  }) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/tv/popular',
        parameters: {
          'language': language,
          'page': page,
        },
      );
  static APIRequest getTopRatedTV({
    required String language,
    required int page,
  }) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/tv/popular',
        parameters: {
          'language': language,
          'page': page,
        },
      );
  static APIRequest getTrendingTV({
    required String language,
    required int page,
    required String timewindow,
  }) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/trending/tv/$timewindow',
        parameters: {
          'language': language,
          'page': page,
          'time_window': timewindow
        },
      );
  static APIRequest getRecommendations(
          {required String language, required int page, required int tvId}) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/tv/$tvId/similar',
        parameters: {
          'language': language,
          'page': page,
          'series_id': tvId,
        },
      );
}
