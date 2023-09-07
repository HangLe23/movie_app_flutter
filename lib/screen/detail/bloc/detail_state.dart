part of 'detail_bloc.dart';

@immutable
abstract class DetailState {
  final ObjectResponse<Detail>? details;
  final ObjectResponse<DetailTvSeries>? detailTv;
  final ObjectResponse<TvSeasonDetail>? tvSeason;
  final String? error;
  const DetailState({this.details, this.detailTv, this.tvSeason, this.error});
}

class DetailInitial extends DetailState {}

final class LoadDetail extends DetailState {}

final class ListDataDetail extends DetailState {
  const ListDataDetail({required super.details, super.error});
}

final class ListDataDetailTv extends DetailState {
  const ListDataDetailTv({required super.detailTv, super.error});
}

final class ListTvSeason extends DetailState {
  const ListTvSeason({required super.tvSeason, super.error});
}

final class DetailError extends DetailState {
  const DetailError(
      {required super.details, required super.detailTv, super.error});
}
