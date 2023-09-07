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
