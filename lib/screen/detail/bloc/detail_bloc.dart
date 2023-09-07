import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/responsitories/detail_reponsitories/detail_reponsitory.dart';

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

  FutureOr<void> onGetData(
      GetDataDetail event, Emitter<DetailState> emit) async {
    emit(LoadDetail());
    try {
      var details = await reponsitory.getDetailMovie(
        language: event.language,
        movieId: event.movieId,
      );

      emit(ListDataDetail(details: details));
    } catch (e) {
      emit(DetailError(error: e.toString(), details: null, detailTv: null));
      log(e.toString());
    }
  }

  FutureOr<void> onGetDataTv(
      GetDataDetailTv event, Emitter<DetailState> emit) async {
    emit(LoadDetail());
    try {
      var details = await reponsitory.getDetailTvSeries(
        language: event.language,
        tvId: event.tvId,
      );

      emit(ListDataDetailTv(detailTv: details));
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
      log(details.toString());
      emit(ListTvSeason(tvSeason: details));
    } catch (e) {
      emit(DetailError(error: e.toString(), details: null, detailTv: null));
      log(e.toString());
    }
  }
}
