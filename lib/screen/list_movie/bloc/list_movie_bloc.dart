import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/responsitories/movie_reponsitories/movie_reponsitory.dart';

import '../../../api/apis/api.dart';
import '../../../models/movie_models/movie_model.dart';

part 'list_movie_event.dart';
part 'list_movie_state.dart';

class ListMovieBloc extends Bloc<ListMovieEvent, ListMovieState> {
  MovieReponsitory reponsitory =
      MovieReponsitory(restApiClient: RestApiClient());
  ListMovieBloc() : super(ListMovieInitial()) {
    on<GetData>(onGetData);
  }

  FutureOr<void> onGetData(GetData event, Emitter<ListMovieState> emit) async {
    try {
      var movies = await reponsitory.getMovie(
        language: event.language,
        page: event.page,
        region: event.region,
      );
      print('hjhjjhjb ${movies.list.length.toString()}');
      emit(ListData(movies: movies));
    } catch (e) {
      emit(ListError(error: e.toString(), movies: null));
    }
  }
}
