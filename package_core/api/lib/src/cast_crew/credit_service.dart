import 'package:api/index.dart';
import 'package:domain/domain.dart';

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
