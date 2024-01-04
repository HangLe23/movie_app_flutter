import '../../apis/api.dart';

class VideoRequest {
  VideoRequest._();
  static APIRequest getVideoMovie({
    required int movieId,
    required String language,
  }) =>
      APIRequest(
        method: HTTPMethods.get,
        path: '/movie/$movieId/videos',
        parameters: {
          'movie_id': movieId,
          'language': language,
        },
      );
}
