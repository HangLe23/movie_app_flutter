import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/api/src/movies/movie_service.dart';
import 'package:movie_app_flutter/models/movie_models/movie_model.dart';

class MovieReponsitory {
  RestApiClient restApiClient;
  MovieReponsitory({required this.restApiClient});
  //NowPlaying
  Future<ListResponse<MovieModel>> getNowPlayingMovie(
      {required String language,
      required int page,
      required String region}) async {
    return MovieService(apiClient: restApiClient).getNowPlayingMovie(
      language: language,
      page: page,
      region: region,
    );
  }

  //Popular
  Future<ListResponse<MovieModel>> getPopularMovie(
      {required String language,
      required int page,
      required String region}) async {
    return MovieService(apiClient: restApiClient).getNowPlayingMovie(
      language: language,
      page: page,
      region: region,
    );
  }

  //Top Rate
  Future<ListResponse<MovieModel>> getTopRateMovie(
      {required String language,
      required int page,
      required String region}) async {
    return MovieService(apiClient: restApiClient).getTopRateMovie(
      language: language,
      page: page,
      region: region,
    );
  }

  //Up Coming
  Future<ListResponse<MovieModel>> getUpComingMovie(
      {required String language,
      required int page,
      required String region}) async {
    return MovieService(apiClient: restApiClient).getUpComingMovie(
      language: language,
      page: page,
      region: region,
    );
  }

  //Trending
  Future<ListResponse<MovieModel>> getTrendingMovie(
      {required String timeWindow,
      required String language,
      required int page,
      required String region}) async {
    return MovieService(apiClient: restApiClient).getTrendingMovie(
      timeWindow: timeWindow,
      language: language,
      page: page,
      region: region,
    );
  }
}
