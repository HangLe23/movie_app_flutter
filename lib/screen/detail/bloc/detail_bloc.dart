import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../cast_and_drew/cast_and_drew.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<SwitchScreen>((event, emit) async {
      emit(LoadSwitch());
      await Future.delayed(const Duration(seconds: 1));
      Navigator.of(event.context).push(MaterialPageRoute(
        builder: (context) =>
            const CastAndDrew(), // Thay CastAndDrew bằng màn hình bạn muốn chuyển đến
      ));
      emit(Switched());
    });
  }
}
