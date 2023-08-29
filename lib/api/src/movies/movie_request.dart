import 'package:movie_app_flutter/api/apis/api_client/api_request.dart';
import 'package:movie_app_flutter/api/apis/api_client/http_method.dart';

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
}
