import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/cast_crew.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<SwitchScreen>((event, emit) async {
      emit(LoadSwitch());
      await Future.delayed(const Duration(seconds: 1));

      emit(Switched());
    });
  }
}
