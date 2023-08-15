import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigationbar_event.dart';
part 'navigationbar_state.dart';

class NavigationbarBloc extends Bloc<NavigationbarEvent, NavigationbarState> {
  NavigationbarBloc() : super(const NavigationbarInitial(0)) {
    on<NavigationbarEvent>((event, emit) {
      if (event is TabChange) {
        emit(NavigationbarInitial(event.index));
      }
    });
  }
}
