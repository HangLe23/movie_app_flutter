import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/src/cast_crew/credit_request.dart';
import 'package:movie_app_flutter/models/cast_crew/cast_crew.dart';

class CreditService {
  APIClient apiClient;
  CreditService({required this.apiClient});
  Future<ObjectResponse<CastCrew>> getCastCrew({
    required String language,
    required int movieId,
  }) async {
    final request = CreditRequest.getCastCrewMovie(
      language: language,
      movieId: movieId,
    );
    final response = await apiClient.execute(request: request);
    final objectResponse = CastCrew.fromJson(response.toObject());
    return ObjectResponse(object: objectResponse);
  }
}
