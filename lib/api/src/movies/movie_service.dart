import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/src/movies/movie_request.dart';
import 'package:movie_app_flutter/models/movie_models/movie_model.dart';

class MovieService {
  APIClient apiClient;
  MovieService({required this.apiClient});
  //Now Playing
  Future<ListResponse<MovieModel>> getNowPlayingMovie(
      {required String language,
      required int page,
      required String region}) async {
    var request = MovieRequest.getNowPlaying(
      language: language,
      page: page,
      region: region,
    );
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<MovieModel>((e) => MovieModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }

  //Popular
  Future<ListResponse<MovieModel>> getPopularMovie(
      {required String language,
      required int page,
      required String region}) async {
    var request = MovieRequest.getPopular(
      language: language,
      page: page,
      region: region,
    );
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<MovieModel>((e) => MovieModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }

  //Top Rate
  Future<ListResponse<MovieModel>> getTopRateMovie(
      {required String language,
      required int page,
      required String region}) async {
    var request = MovieRequest.getTopRated(
      language: language,
      page: page,
      region: region,
    );
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<MovieModel>((e) => MovieModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }

  //UpComing
  Future<ListResponse<MovieModel>> getUpComingMovie(
      {required String language,
      required int page,
      required String region}) async {
    var request = MovieRequest.getUpComing(
      language: language,
      page: page,
      region: region,
    );
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<MovieModel>((e) => MovieModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }

  //Trending
  Future<ListResponse<MovieModel>> getTrendingMovie(
      {required String timeWindow,
      required String language,
      required int page,
      required String region}) async {
    var request = MovieRequest.getTrending(
      timeWindow: timeWindow,
      language: language,
      page: page,
      region: region,
    );
    final response = await apiClient.execute(request: request);
    final listResponse = response
        .toList()
        .map<MovieModel>((e) => MovieModel.fromJson(e))
        .toList();
    return ListResponse(list: listResponse);
  }
}
