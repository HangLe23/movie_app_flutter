import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/src/homes/home_service.dart';
import 'package:movie_app_flutter/api/src/movies/movie_service.dart';

import '../../api/rest_api/rest_api_client.dart';
import '../../models/movie_models/movie_model.dart';

class MovieReponsitory {
  RestApiClient restApiClient;
  MovieReponsitory({required this.restApiClient});
  Future<ListResponse<MovieModel>> getMovie(
      {required String language,
      required int page,
      required String region}) async {
    return MovieService(apiClient: restApiClient).getMovie(
      language: language,
      page: page,
      region: region,
    );
  }

  Future<ListResponse<MovieModel>> getTopRate(
      {required String language,
      required int page,
      required String region}) async {
    return HomeService(apiClient: restApiClient).getTopRate(
      language: language,
      page: page,
      region: region,
    );
  }
}
