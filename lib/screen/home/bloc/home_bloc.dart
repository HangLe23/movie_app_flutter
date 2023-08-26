import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/api/apis/api_client/response_model.dart';

import '../../../api/rest_api/rest_api_client.dart';
import '../../../models/movie_models/movie_model.dart';
import '../../../responsitories/movie_reponsitories/movie_reponsitory.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieReponsitory reponsitory =
      MovieReponsitory(restApiClient: RestApiClient());
  HomeBloc() : super(HomeInitial()) {
    on<GetTopRate>(onGetData);
  }

  Future<void> onGetData(GetTopRate event, Emitter<HomeState> emit) async {
    try {
      var movies = await reponsitory.getTopRate(
        language: event.language,
        page: event.page,
        region: event.region,
      );
      emit(ListTopRate(movies: movies));
    } catch (e) {
      emit(HomeError(error: e.toString(), movies: null));
    }
  }
}
