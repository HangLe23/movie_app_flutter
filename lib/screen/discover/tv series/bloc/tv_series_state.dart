part of 'tv_series_bloc.dart';

@immutable
abstract class TvSeriesState {
  final ListResponse<TvSeriesModel>? tvseries;
  final String? error;
  const TvSeriesState({this.tvseries, this.error});
}

final class TvSeriesInitial extends TvSeriesState {}

final class LoadTvSeries extends TvSeriesState {}

final class ListTvSeries extends TvSeriesState {
  const ListTvSeries({required super.tvseries, super.error});
}

final class TvSeriesError extends TvSeriesState {
  const TvSeriesError({required super.tvseries, required super.error});
}
