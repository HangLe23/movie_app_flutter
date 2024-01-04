import 'package:api/index.dart';
import 'package:domain/domain.dart';

class VideoService {
  APIClient apiClient;
  VideoService({required this.apiClient});
  Future<ListResponse<VideoItem>> getVideoMovie({
    required String language,
    required int movieId,
  }) async {
    final request = VideoRequest.getVideoMovie(
      language: language,
      movieId: movieId,
    );
    final response = await apiClient.execute(request: request);
    final listResponse =
        response.toList().map<VideoItem>((e) => VideoItem.fromJson(e)).toList();
    return ListResponse(list: listResponse);
  }
}
