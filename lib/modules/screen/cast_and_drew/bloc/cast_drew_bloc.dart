import 'dart:async';

import 'package:api/index.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/index.dart';

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
