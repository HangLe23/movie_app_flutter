import '../../apis/api.dart';

class MovieRequest {
  MovieRequest._();
  static APIRequest getNowPlaying(
          {required String language,
          required int page,
          required String region}) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/movie/now_playing',
        parameters: {
          'language': language,
          'page': page,
          'region': region,
        },
      );
  static APIRequest getTopRated(
          {required String language,
          required int page,
          required String region}) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/movie/top_rated',
        parameters: {
          'language': language,
          'page': page,
          'region': region,
        },
      );
  static APIRequest getPopular(
          {required String language,
          required int page,
          required String region}) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/movie/popular',
        parameters: {
          'language': language,
          'page': page,
          'region': region,
        },
      );
  static APIRequest getUpComing(
          {required String language,
          required int page,
          required String region}) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/movie/upcoming',
        parameters: {
          'language': language,
          'page': page,
          'region': region,
        },
      );
  static APIRequest getTrending(
          {required String language,
          required String timeWindow,
          required int page,
          required String region}) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/trending/movie/$timeWindow',
        parameters: {
          'time_window': timeWindow,
          'language': language,
          'page': page,
          'region': region,
        },
      );
  static APIRequest getRecommendations(
          {required String language,
          required int page,
          required int movieId}) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/movie/$movieId/similar',
        parameters: {
          'language': language,
          'page': page,
          'movie_id': movieId,
        },
      );
}
