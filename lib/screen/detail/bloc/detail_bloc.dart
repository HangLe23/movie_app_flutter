import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/models/detail/detail.dart';
import 'package:movie_app_flutter/responsitories/detail_reponsitories/detail_reponsitory.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailReponsitory reponsitory =
      DetailReponsitory(restApiClient: RestApiClient());
  DetailBloc() : super(DetailInitial()) {
    on<GetDataDetail>(onGetData);
  }

  FutureOr<void> onGetData(
      GetDataDetail event, Emitter<DetailState> emit) async {
    emit(LoadDetail());
    try {
      var details = await reponsitory.getDetail(
        language: event.language,
        movieId: event.movieId,
      );

      emit(ListDataDetail(details: details));
    } catch (e) {
      emit(DetailError(error: e.toString(), details: null));
    }
  }
}
