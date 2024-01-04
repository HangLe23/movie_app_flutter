import 'dart:async';

import 'package:api/index.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'tv_series_event.dart';
part 'tv_series_state.dart';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  TvSeriesRepository reponsitory =
      TvSeriesRepository(restApiClient: RestApiClient());
  TvSeriesBloc() : super(const TvSeriesInitial(page: 1)) {
    on<GetTvSeries>(onGetData);
    on<GetRecommendation>(onGetRecommendation);
    on<LoadMoreTV>(onLoadMore);
    on<RefreshPageTV>(onRefresh);
  }

  RefreshController refreshController = RefreshController();

  FutureOr<void> onGetData(
      GetTvSeries event, Emitter<TvSeriesState> emit) async {
    emit(const LoadTvSeries(page: 1));
    try {
      var uniqueIds = <int>{}; // Set để lưu trữ các ID duy nhất
      var tvseries = <TvSeriesModel>[];
      var sources = [
        //Airing Today
        await reponsitory.getAiringToday(
          language: event.language,
          page: event.page,
          timezone: '',
        ),
        //popular
        await reponsitory.getPoplarTV(
          language: event.language,
          page: event.page,
        ),
        //top rate
        await reponsitory.getPoplarTV(
          language: event.language,
          page: event.page,
        ),
        //trending
        await reponsitory.getTrendingTV(
          language: event.language,
          page: event.page,
          timewindow: 'week',
        ),
        //up coming
        await reponsitory.getOnTheAir(
          language: event.language,
          page: event.page,
          timezone: '',
        ),
      ];
      for (var source in sources) {
        var response = source;
        var movieList = response.list;

        for (var tvserie in movieList) {
          if (!uniqueIds.contains(tvserie.id)) {
            uniqueIds.add(tvserie.id ?? 0);
            tvseries.add(tvserie);
          }
        }
      }
      emit(ListTvSeries(tvseries: tvseries, pageListTv: state.page));
    } catch (e) {
      emit(TvSeriesError(error: e.toString(), tvseries: null));
    }
  }

  FutureOr<void> onGetRecommendation(
      GetRecommendation event, Emitter<TvSeriesState> emit) async {
    emit(const LoadTvSeries(page: 1));
    try {
      var tvSeries = await reponsitory.getRecommendation(
        language: event.language,
        page: event.page,
        tvId: event.tvId,
      );
      emit(ListTvSeries(tvseries: tvSeries.list, pageListTv: state.page));
    } catch (e) {
      emit(TvSeriesError(error: e.toString(), tvseries: null));
    }
  }

  onLoadMore(LoadMoreTV event, Emitter<TvSeriesState> emit) async {
    try {
      ListResponse<TvSeriesModel> tvSeries = await reponsitory.getAiringToday(
        language: event.language,
        page: event.page,
        timezone: '',
      );
      if (tvSeries.list.isEmpty) {
        refreshController.loadNoData();
      } else {
        var newList = List<TvSeriesModel>.from(state.tvseries ?? [])
          ..addAll(tvSeries.list);
        emit(ListTvSeries(tvseries: newList, pageListTv: event.page));
        refreshController.loadComplete();
      }
      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.loadFailed();
      emit(TvSeriesError(error: e.toString(), tvseries: null));
    }
  }

  onRefresh(RefreshPageTV event, Emitter<TvSeriesState> emit) async {
    try {
      var tvSeries = await reponsitory.getAiringToday(
        language: event.language,
        page: event.page,
        timezone: '',
      );
      refreshController.refreshCompleted();
      emit(ListTvSeries(tvseries: tvSeries.list, pageListTv: event.page));
    } catch (e) {
      refreshController.refreshFailed();
      emit(TvSeriesError(error: e.toString(), tvseries: null));
    }
  }
}
