part of 'tv_series_bloc.dart';

@immutable
abstract class TvSeriesState {
  final List<TvSeriesModel>? tvseries;
  final String? error;
  final int page;
  const TvSeriesState({this.tvseries, this.error, required this.page});
}

final class TvSeriesInitial extends TvSeriesState {
  const TvSeriesInitial({required super.page});
}

final class LoadTvSeries extends TvSeriesState {
  const LoadTvSeries({required super.page});
}

final class ListTvSeries extends TvSeriesState {
  final int pageListTv;
  const ListTvSeries(
      {required super.tvseries, required this.pageListTv, super.error})
      : super(page: pageListTv);
}

final class TvSeriesError extends TvSeriesState {
  const TvSeriesError({required super.tvseries, required super.error})
      : super(page: 1);
}

final class EmptyData extends TvSeriesState {
  const EmptyData({required super.tvseries, super.error}) : super(page: 1);
}
