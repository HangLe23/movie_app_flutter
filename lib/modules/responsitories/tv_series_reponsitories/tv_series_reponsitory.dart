import 'package:api/index.dart';
import 'package:domain/domain.dart';

class TvSeriesRepository {
  RestApiClient restApiClient;
  TvSeriesRepository({required this.restApiClient});
  Future<ListResponse<TvSeriesModel>> getAiringToday({
    required String language,
    required int page,
    required String timezone,
  }) async {
    return TvSeriesService(apiClient: restApiClient).getAiringToday(
      language: language,
      page: page,
      timezone: timezone,
    );
  }

  Future<ListResponse<TvSeriesModel>> getOnTheAir({
    required String language,
    required int page,
    required String timezone,
  }) async {
    return TvSeriesService(apiClient: restApiClient).getOnTheAir(
      language: language,
      page: page,
      timezone: timezone,
    );
  }

  Future<ListResponse<TvSeriesModel>> getPoplarTV({
    required String language,
    required int page,
  }) async {
    return TvSeriesService(apiClient: restApiClient).getPoplarTV(
      language: language,
      page: page,
    );
  }

  Future<ListResponse<TvSeriesModel>> getTopRatedTV({
    required String language,
    required int page,
  }) async {
    return TvSeriesService(apiClient: restApiClient).getTopRatedTV(
      language: language,
      page: page,
    );
  }

  Future<ListResponse<TvSeriesModel>> getTrendingTV({
    required String language,
    required int page,
    required String timewindow,
  }) async {
    return TvSeriesService(apiClient: restApiClient).getTrenndingTV(
      language: language,
      page: page,
      timewindow: timewindow,
    );
  }

  Future<ListResponse<TvSeriesModel>> getRecommendation({
    required String language,
    required int page,
    required int tvId,
  }) async {
    return TvSeriesService(apiClient: restApiClient).getRecommendation(
      language: language,
      page: page,
      tvId: tvId,
    );
  }
}
