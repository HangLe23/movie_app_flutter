import 'package:movie_app_flutter/api/apis/api.dart';

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
}
