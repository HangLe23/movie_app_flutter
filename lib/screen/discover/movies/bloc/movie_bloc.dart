import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/models/movie_models/movie_model.dart';
import 'package:movie_app_flutter/responsitories/movie_reponsitories/movie_reponsitory.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieReponsitory reponsitory =
      MovieReponsitory(restApiClient: RestApiClient());
  MovieBloc() : super(MovieInitial()) {
    on<GetMovie>(onGetData);
  }

  Future<void> onGetData(GetMovie event, Emitter<MovieState> emit) async {
    emit(LoadMovie());
    try {
      var uniqueIds = <int>{}; // Set để lưu trữ các ID duy nhất
      var movies = <MovieModel>[];
      var sources = [
        //now playing
        await reponsitory.getNowPlayingMovie(
          language: event.language,
          page: event.page,
          region: event.region,
        ),
        //popular
        await reponsitory.getPopularMovie(
          language: event.language,
          page: event.page,
          region: event.region,
        ),
        //top rate
        await reponsitory.getTopRateMovie(
          language: event.language,
          page: event.page,
          region: event.region,
        ),
        //trending
        await reponsitory.getTrendingMovie(
          language: event.language,
          page: event.page,
          region: event.region,
          timeWindow: 'week',
        ),
        //up coming
        await reponsitory.getUpComingMovie(
          language: event.language,
          page: event.page,
          region: event.region,
        ),
      ];
      for (var source in sources) {
        var response = source;
        var movieList = response.list;

        for (var movie in movieList) {
          if (!uniqueIds.contains(movie.id)) {
            uniqueIds.add(movie.id ?? 0);
            movies.add(movie);
          }
        }
      }
      emit(ListMovie(movies: ListResponse<MovieModel>(list: movies)));
    } catch (e) {
      emit(MovieError(error: e.toString(), movies: null));
    }
  }
}
