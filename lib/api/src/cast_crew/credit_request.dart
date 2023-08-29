import 'package:movie_app_flutter/api/apis/api.dart';

class CreditRequest {
  CreditRequest._();
  static APIRequest getCastCrewMovie(
          {required String language, required int movieId}) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/movie/$movieId/credits',
        parameters: {'language': language, 'movie_id': movieId},
      );
}
