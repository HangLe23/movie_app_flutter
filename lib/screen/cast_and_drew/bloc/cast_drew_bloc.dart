import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cast_drew_event.dart';
part 'cast_drew_state.dart';

class CastDrewBloc extends Bloc<CastDrewEvent, CastDrewState> {
  CastDrewBloc() : super(CastDrewInitial()) {
    on<CastDrewEvent>((event, emit) {});
  }
}
