import 'package:api/index.dart';
import 'package:domain/domain.dart';

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
