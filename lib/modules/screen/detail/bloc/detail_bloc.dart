import 'dart:async';

import 'package:api/index.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/index.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailReponsitory reponsitory =
      DetailReponsitory(restApiClient: RestApiClient());
  DetailBloc() : super(DetailInitial()) {
    on<GetDataDetail>(onGetData);
    on<GetDataDetailTv>(onGetDataTv);
    on<GetTvSeason>(onGetTvSeason);
  }
//movie
  FutureOr<void> onGetData(
      GetDataDetail event, Emitter<DetailState> emit) async {
    emit(LoadDetail());
    try {
      var details = await reponsitory.getDetailMovie(
        language: event.language,
        movieId: event.movieId,
      );
      var casts =
          await CreditRepository(restApiClient: RestApiClient()).getCastCrew(
        language: event.language,
        movieId: event.movieId,
      );
      var movies = await MovieReponsitory(restApiClient: RestApiClient())
          .getRecommendation(
        language: event.language,
        movieId: event.movieId,
        page: 1,
      );
      emit(ListDataDetail(
        details: details,
        castMovieData: casts,
        movie: movies,
      ));
    } catch (e) {
      emit(DetailError(error: e.toString(), details: null, detailTv: null));
    }
  }

//tv series
  FutureOr<void> onGetDataTv(
      GetDataDetailTv event, Emitter<DetailState> emit) async {
    emit(LoadDetail());
    try {
      var details = await reponsitory.getDetailTvSeries(
        language: event.language,
        tvId: event.tvId,
      );

      var tvseries = await TvSeriesRepository(restApiClient: RestApiClient())
          .getRecommendation(
        language: event.language,
        tvId: event.tvId,
        page: 1,
      );
      emit(ListDataDetailTv(detailTv: details, tvseries: tvseries));
    } catch (e) {
      emit(DetailError(error: e.toString(), details: null, detailTv: null));
    }
  }

  FutureOr<void> onGetTvSeason(
      GetTvSeason event, Emitter<DetailState> emit) async {
    emit(LoadDetail());
    try {
      var details = await reponsitory.getTvSeason(
        language: event.language,
        tvId: event.tvId,
        season: event.season,
      );
      emit(ListDataTvSeason(tvSeason: details));
    } catch (e) {
      emit(DetailError(error: e.toString(), details: null, detailTv: null));
    }
  }
}
