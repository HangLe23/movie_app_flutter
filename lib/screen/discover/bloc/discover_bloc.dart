import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc() : super(const DiscoverInitial(index: 0)) {
    on<TextChange>((event, emit) {
      if (event.text.isEmpty) {
        emit(const DiscoverInitial(index: 0));
      } else {
        emit(SerchResult(result: event.text, index: 0));
      }
    });
    on<TabChange>((event, emit) {
      if (state is TabChange) {
        emit(DiscoverInitial(index: event.index));
      }
    });
  }
}
