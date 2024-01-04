import 'package:api/index.dart';
import 'package:domain/domain.dart';

class VideoRepository {
  RestApiClient restApiClient;
  VideoRepository({required this.restApiClient});
  Future<ListResponse<VideoItem>> getVideoMovie({
    required String language,
    required int movieId,
  }) async {
    return VideoService(apiClient: restApiClient)
        .getVideoMovie(language: language, movieId: movieId);
  }
}
