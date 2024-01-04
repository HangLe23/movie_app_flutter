import 'package:api/index.dart';
import 'package:domain/domain.dart';

class MultipleService {
  MultipleService({required this.apiClient});
  APIClient apiClient;
  Future<ListResponse<MultipleMedia>> searchMultipleMedia({
    required String query,
    required bool includeAdult,
    required String language,
    required int page,
  }) async {
    final request = MultipleRequest.searchMultipleMedia(
      query: query,
      includeAdult: includeAdult,
      language: language,
      page: page,
    );
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<MultipleMedia>((e) => MultipleMedia.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }
}
