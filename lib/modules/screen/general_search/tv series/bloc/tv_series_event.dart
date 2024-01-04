part of 'tv_series_bloc.dart';

@immutable
abstract class TvSeriesEvent {}

class GetTvSeries extends TvSeriesEvent {
  final String language;
  final int page;
  GetTvSeries({required this.language, required this.page});
}

class GetRecommendation extends TvSeriesEvent {
  final String language;
  final int page;
  final int tvId;
  GetRecommendation(
      {required this.language, required this.page, required this.tvId});
}

class LoadMoreTV extends TvSeriesEvent {
  final String language;
  final int page;
  final String region;
  LoadMoreTV(
      {required this.language, required this.page, required this.region});
}

class RefreshPageTV extends TvSeriesEvent {
  final String language;
  final int page;
  final String region;
  RefreshPageTV(
      {required this.language, required this.region, required this.page});
}
