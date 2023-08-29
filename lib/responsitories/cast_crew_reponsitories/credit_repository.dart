import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/api/src/cast_crew/credit_service.dart';
import 'package:movie_app_flutter/models/cast_crew/cast_crew.dart';

class CreditRepository {
  RestApiClient restApiClient;
  CreditRepository({required this.restApiClient});
  Future<ObjectResponse<CastCrew>> getCastCrew({
    required String language,
    required int movieId,
  }) async {
    return CreditService(apiClient: restApiClient)
        .getCastCrew(language: language, movieId: movieId);
  }
}
