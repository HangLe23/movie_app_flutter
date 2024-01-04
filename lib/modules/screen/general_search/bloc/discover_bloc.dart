import 'dart:async';

import 'package:api/index.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/index.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  MultipleMediaReponsitory reponsitory =
      MultipleMediaReponsitory(restApiClient: RestApiClient());
  DiscoverBloc() : super(DiscoverInitial()) {
    on<TabChange>((event, emit) async {
      emit(LoadSearch());
      try {
        emit(ChangeTab(index: event.index));
      } catch (e) {
        emit(SearchError(error: e.toString(), result: null));
      }
    });
    on<TextChange>(onSearchData);
  }

  FutureOr<void> onSearchData(
      TextChange event, Emitter<DiscoverState> emit) async {
    emit(LoadSearch());
    try {
      var result = await reponsitory.searchMultipleMedia(
        query: event.text,
        includeAdult: false,
        language: 'en-US',
        page: 1,
      );
      emit(SearchResult(result: result));
    } catch (e) {
      emit(SearchError(error: e.toString(), result: null));
    }
  }
}
