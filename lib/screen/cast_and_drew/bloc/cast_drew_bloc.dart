import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/responsitories/repository.dart';

part 'cast_drew_event.dart';
part 'cast_drew_state.dart';

class CastCrewBloc extends Bloc<CastCrewEvent, CastCrewState> {
  CreditRepository reponsitory =
      CreditRepository(restApiClient: RestApiClient());
  CastCrewBloc() : super(CastCrewInitial()) {
    on<GetDataCastCrew>(onGetData);
  }

  FutureOr<void> onGetData(
      GetDataCastCrew event, Emitter<CastCrewState> emit) async {
    emit(LoadCastCrew());
    try {
      var casts = await reponsitory.getCastCrew(
        language: event.language,
        movieId: event.movieId,
      );

      emit(ListDataCastCrew(casts: casts));
    } catch (e) {
      emit(CastCrewError(error: e.toString(), casts: null));
    }
  }
}
