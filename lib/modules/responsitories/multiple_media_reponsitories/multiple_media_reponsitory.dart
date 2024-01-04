import 'package:api/index.dart';
import 'package:domain/domain.dart';

class MultipleMediaReponsitory {
  RestApiClient restApiClient;
  MultipleMediaReponsitory({required this.restApiClient});

  Future<ListResponse<MultipleMedia>> searchMultipleMedia({
    required String query,
    required bool includeAdult,
    required String language,
    required int page,
  }) async {
    return MultipleService(apiClient: restApiClient).searchMultipleMedia(
      query: query,
      includeAdult: includeAdult,
      language: language,
      page: page,
    );
  }
}
