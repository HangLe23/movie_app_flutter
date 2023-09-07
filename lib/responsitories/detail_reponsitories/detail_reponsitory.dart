import 'package:movie_app_flutter/api/apis/api_client/index.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/api/src/src.dart';
import 'package:movie_app_flutter/models/model.dart';

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
