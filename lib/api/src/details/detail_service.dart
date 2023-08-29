import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/src/details/detail_request.dart';
import 'package:movie_app_flutter/models/detail/detail.dart';

class DetailService {
  APIClient apiClient;
  DetailService({required this.apiClient});
  Future<ObjectResponse<Detail>> getDetailMovie({
    required String language,
    required int movieId,
    String? appendToResponse,
  }) async {
    final request = DetailRequest.getDetailMovie(
      movieId: movieId,
      language: language,
      appendToResponse: appendToResponse,
    );
    final response = await apiClient.execute(request: request);
    final objectResponse = Detail.fromJson(response.toObject());
    return ObjectResponse(object: objectResponse);
  }
}
