import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/src/src.dart';
import 'package:movie_app_flutter/models/model.dart';

class TvSeriesService {
  APIClient apiClient;
  TvSeriesService({required this.apiClient});
  Future<ListResponse<TvSeriesModel>> getAiringToday(
      {required String language,
      required int page,
      required String timezone}) async {
    var request = TvSeriesRequest.getAiringToday(
        language: language, page: page, timezone: timezone);
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<TvSeriesModel>((e) => TvSeriesModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }

  Future<ListResponse<TvSeriesModel>> getOnTheAir(
      {required String language,
      required int page,
      required String timezone}) async {
    var request = TvSeriesRequest.getOnTheAir(
        language: language, page: page, timezone: timezone);
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<TvSeriesModel>((e) => TvSeriesModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }

  Future<ListResponse<TvSeriesModel>> getPoplarTV(
      {required String language, required int page}) async {
    var request = TvSeriesRequest.getPoplarTV(language: language, page: page);
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<TvSeriesModel>((e) => TvSeriesModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }

  Future<ListResponse<TvSeriesModel>> getTopRatedTV(
      {required String language, required int page}) async {
    var request = TvSeriesRequest.getTopRatedTV(language: language, page: page);
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<TvSeriesModel>((e) => TvSeriesModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }

  Future<ListResponse<TvSeriesModel>> getTrenndingTV(
      {required String language,
      required int page,
      required String timewindow}) async {
    var request = TvSeriesRequest.getTrendingTV(
        language: language, page: page, timewindow: timewindow);
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<TvSeriesModel>((e) => TvSeriesModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }

  Future<ListResponse<TvSeriesModel>> getRecommendation({
    required int tvId,
    required String language,
    required int page,
  }) async {
    var request = TvSeriesRequest.getRecommendations(
      language: language,
      page: page,
      tvId: tvId,
    );
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<TvSeriesModel>((e) => TvSeriesModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }
}
