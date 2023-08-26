import 'package:movie_app_flutter/api/apis/api_client/api_request.dart';
import 'package:movie_app_flutter/api/apis/api_client/http_method.dart';

class HomeRequest {
  HomeRequest._();
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
  static APIRequest getBanner(
          {required String language,
          required int page,
          required String region}) =>
      APIRequest(
          method: HTTPMethods.get,
          path: '/movie/top_rated/1',
          parameters: {
            'language': language,
            'page': page,
            'region': region,
          });
}
