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
}
