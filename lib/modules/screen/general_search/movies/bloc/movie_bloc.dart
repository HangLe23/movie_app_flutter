import 'dart:async';

import 'package:api/index.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieReponsitory reponsitory =
      MovieReponsitory(restApiClient: RestApiClient());
  MovieBloc() : super(const MovieInitial(page: 1)) {
    on<GetMovie>(onGetData);
    on<GetRecommendation>(onGetRecommendation);
    on<LoadMore>(onLoadMore);
    on<RefreshPage>(onRefresh);
  }

  RefreshController refreshController = RefreshController();

  Future<void> onGetData(GetMovie event, Emitter<MovieState> emit) async {
    emit(const LoadMovie(page: 1));
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
      emit(ListMovie(movies: movies, pageListMovie: state.page));
    } catch (e) {
      emit(MovieError(error: e.toString(), movies: null));
    }
  }

  FutureOr<void> onGetRecommendation(
      GetRecommendation event, Emitter<MovieState> emit) async {
    emit(const LoadMovie(page: 1));
    try {
      var movies = await reponsitory.getRecommendation(
        language: event.language,
        page: event.page,
        movieId: event.movieId,
      );
      emit(ListMovie(movies: movies.list, pageListMovie: state.page));
    } catch (e) {
      emit(MovieError(error: e.toString(), movies: null));
    }
  }

  onLoadMore(LoadMore event, Emitter<MovieState> emit) async {
    try {
      ListResponse<MovieModel> movies = await reponsitory.getNowPlayingMovie(
        language: event.language,
        page: event.page,
        region: event.region,
      );
      if (movies.list.isEmpty) {
        refreshController.loadNoData();
      } else {
        var newList = List<MovieModel>.from(state.movies ?? [])
          ..addAll(movies.list);
        emit(ListMovie(movies: newList, pageListMovie: event.page));
        refreshController.loadComplete();
      }
      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.loadFailed();
      emit(MovieError(error: e.toString(), movies: null));
    }
  }

  onRefresh(RefreshPage event, Emitter<MovieState> emit) async {
    try {
      var movies = await reponsitory.getNowPlayingMovie(
        language: event.language,
        page: event.page,
        region: event.region,
      );
      refreshController.refreshCompleted();
      emit(ListMovie(movies: movies.list, pageListMovie: event.page));
    } catch (e) {
      refreshController.refreshFailed();
      emit(MovieError(error: e.toString(), movies: null));
    }
  }
}
