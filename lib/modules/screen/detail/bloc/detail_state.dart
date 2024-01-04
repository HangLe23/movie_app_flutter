part of 'detail_bloc.dart';

@immutable
abstract class DetailState {
  final ObjectResponse<Detail>? details;
  final ObjectResponse<DetailTvSeries>? detailTv;
  final ObjectResponse<TvSeasonDetail>? tvSeason;
  final ObjectResponse<CastCrew>? castMovieData;
  final ListResponse<MovieModel>? movie;
  final ListResponse<TvSeriesModel>? tvseries;
  final String? error;
  const DetailState(
      {this.details,
      this.detailTv,
      this.castMovieData,
      this.tvSeason,
      this.movie,
      this.tvseries,
      this.error});
}

class DetailInitial extends DetailState {}

final class LoadDetail extends DetailState {}

final class ListDataDetail extends DetailState {
  const ListDataDetail({
    required super.details,
    required super.castMovieData,
    required super.movie,
    super.error,
  });
}

final class ListDataDetailTv extends DetailState {
  const ListDataDetailTv(
      {required super.detailTv, required super.tvseries, super.error});
}

final class ListDataTvSeason extends DetailState {
  const ListDataTvSeason({required super.tvSeason, super.error});
}

final class DetailError extends DetailState {
  const DetailError(
      {required super.details, required super.detailTv, super.error});
}
