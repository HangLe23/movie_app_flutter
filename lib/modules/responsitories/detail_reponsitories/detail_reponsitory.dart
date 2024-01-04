import 'package:api/index.dart';
import 'package:domain/domain.dart';

class DetailReponsitory {
  RestApiClient restApiClient;
  DetailReponsitory({required this.restApiClient});
  Future<ObjectResponse<Detail>> getDetailMovie({
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

  Future<ObjectResponse<DetailTvSeries>> getDetailTvSeries({
    required String language,
    required int tvId,
    String? appendToResponse,
  }) async {
    return DetailService(apiClient: restApiClient).getDetailTvSeries(
      tvId: tvId,
      language: language,
    );
  }

  Future<ObjectResponse<TvSeasonDetail>> getTvSeason({
    required String language,
    required int tvId,
    required int season,
    String? appendToResponse,
  }) async {
    return DetailService(apiClient: restApiClient).getTvSeason(
      tvId: tvId,
      language: language,
      season: season,
    );
  }
}
