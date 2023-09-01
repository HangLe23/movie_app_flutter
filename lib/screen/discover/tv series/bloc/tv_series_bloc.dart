import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_flutter/api/apis/api.dart';
import 'package:movie_app_flutter/api/rest_api/rest_api_client.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/responsitories/repository.dart';

part 'tv_series_event.dart';
part 'tv_series_state.dart';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  TvSeriesRepository reponsitory =
      TvSeriesRepository(restApiClient: RestApiClient());
  TvSeriesBloc() : super(TvSeriesInitial()) {
    on<GetTvSeries>(onGetData);
  }

  Future<FutureOr<void>> onGetData(
      GetTvSeries event, Emitter<TvSeriesState> emit) async {
    emit(LoadTvSeries());
    try {
      var uniqueIds = <int>{}; // Set để lưu trữ các ID duy nhất
      var tvseries = <TvSeriesModel>[];
      var sources = [
        //Airing Today
        await reponsitory.getAiringToday(
          language: event.language,
          page: event.page,
          timezone: '',
        ),
        //popular
        await reponsitory.getPoplarTV(
          language: event.language,
          page: event.page,
        ),
        //top rate
        await reponsitory.getPoplarTV(
          language: event.language,
          page: event.page,
        ),
        //trending
        await reponsitory.getTrendingTV(
          language: event.language,
          page: event.page,
          timewindow: 'week',
        ),
        //up coming
        await reponsitory.getOnTheAir(
          language: event.language,
          page: event.page,
          timezone: '',
        ),
      ];
      for (var source in sources) {
        var response = source;
        var movieList = response.list;

        for (var tvserie in movieList) {
          if (!uniqueIds.contains(tvserie.id)) {
            uniqueIds.add(tvserie.id ?? 0);
            tvseries.add(tvserie);
          }
        }
      }
      emit(ListTvSeries(tvseries: ListResponse<TvSeriesModel>(list: tvseries)));
    } catch (e) {
      emit(TvSeriesError(error: e.toString(), tvseries: null));
    }
  }
}
