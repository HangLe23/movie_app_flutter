import 'package:api/index.dart';
import 'package:domain/domain.dart';

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

  Future<ObjectResponse<DetailTvSeries>> getDetailTvSeries({
    required String language,
    required int tvId,
    String? appendToResponse,
  }) async {
    final request = DetailRequest.getDetailTvSeries(
      language: language,
      tvId: tvId,
    );
    final response = await apiClient.execute(request: request);
    final objectResponse = DetailTvSeries.fromJson(response.toObject());
    return ObjectResponse(object: objectResponse);
  }

  Future<ObjectResponse<TvSeasonDetail>> getTvSeason({
    required String language,
    required int tvId,
    required int season,
    String? appendToResponse,
  }) async {
    final request = DetailRequest.getTvSeason(
      language: language,
      tvId: tvId,
      season: season,
    );
    final response = await apiClient.execute(request: request);
    final objectResponse = TvSeasonDetail.fromJson(response.toObject());
    return ObjectResponse(object: objectResponse);
  }
}
