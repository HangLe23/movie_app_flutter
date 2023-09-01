import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/api/src/src.dart';
import 'package:movie_app_flutter/models/model.dart';

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
}
