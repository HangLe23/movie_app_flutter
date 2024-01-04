import 'package:api/index.dart';

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
