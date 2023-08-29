import 'package:movie_app_flutter/api/apis/api_client/response_model.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/api/src/details/detail_service.dart';
import 'package:movie_app_flutter/models/detail/detail.dart';

class DetailReponsitory {
  RestApiClient restApiClient;
  DetailReponsitory({required this.restApiClient});
  Future<ObjectResponse<Detail>> getDetail({
    required String language,
    required int movieId,
    String? appendToResponse,
  }) async {
    return DetailService(apiClient: restApiClient).getDetailMovie(
      movieId: movieId,
      language: language,
      appendToResponse: appendToResponse,
    );
  }
}
