import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainInitial(tabIndex: 0)) {
    on<MainEvent>((event, emit) {
      if (event is BottomTabChange) {
        emit(MainInitial(tabIndex: event.index));
      }
    });
  }
}
