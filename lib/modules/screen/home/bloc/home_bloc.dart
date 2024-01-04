import 'dart:async';

import 'package:api/index.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieReponsitory reponsitory =
      MovieReponsitory(restApiClient: RestApiClient());
  HomeBloc() : super(const HomeInitial(page: 1)) {
    on<GetTopRate>(onGetData);
    on<LoadMoreTopRate>(onLoadMore);
    on<RefreshTopRate>(onRefresh);
  }
  RefreshController refreshController = RefreshController();

  FutureOr<void> onGetData(GetTopRate event, Emitter<HomeState> emit) async {
    emit(const LoadHome(page: 1));
    try {
      var movies = await reponsitory.getTopRateMovie(
        language: event.language,
        page: event.page,
        region: event.region,
      );
      emit(ListTopRate(movies: movies.list, pageListMovie: state.page));
    } catch (e) {
      emit(HomeError(error: e.toString(), movies: null));
    }
  }

  onLoadMore(LoadMoreTopRate event, Emitter<HomeState> emit) async {
    try {
      ListResponse<MovieModel> movies = await reponsitory.getTopRateMovie(
        language: event.language,
        page: event.page,
        region: event.region,
      );
      if (movies.list.isEmpty) {
        refreshController.loadNoData();
      } else {
        var newList = List<MovieModel>.from(state.movies ?? [])
          ..addAll(movies.list);
        emit(ListTopRate(movies: newList, pageListMovie: event.page));
        refreshController.loadComplete();
      }
      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.loadFailed();
      emit(HomeError(error: e.toString(), movies: null));
    }
  }

  onRefresh(RefreshTopRate event, Emitter<HomeState> emit) async {
    try {
      var movies = await reponsitory.getTopRateMovie(
        language: event.language,
        page: event.page,
        region: event.region,
      );
      refreshController.refreshCompleted();
      emit(ListTopRate(movies: movies.list, pageListMovie: event.page));
    } catch (e) {
      refreshController.refreshFailed();
      emit(HomeError(error: e.toString(), movies: null));
    }
  }
}
