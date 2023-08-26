import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/src/movies/movie_request.dart';
import 'package:movie_app_flutter/models/movie_models/movie_model.dart';

class HomeService {
  APIClient apiClient;
  HomeService({required this.apiClient});
  Future<ListResponse<MovieModel>> getTopRate(
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
}
