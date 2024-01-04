import 'package:api/index.dart';
import 'package:domain/domain.dart';

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
    return MovieService(apiClient: restApiClient).getPopularMovie(
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

  Future<ListResponse<MovieModel>> getRecommendation(
      {required String language,
      required int page,
      required int movieId}) async {
    return MovieService(apiClient: restApiClient).getRecommendation(
      language: language,
      page: page,
      movieId: movieId,
    );
  }
}
