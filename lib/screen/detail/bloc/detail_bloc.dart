import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<SwitchScreen>((event, emit) {
      if (event.ischange == 'cast and drew') {
        emit(MoreCastAndDrew());
      } else {
        emit(DetailInitial());
      }
    });
  }
}
