part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class GetDataDetail extends DetailEvent {
  final String language;
  final int movieId;
  GetDataDetail({required this.language, required this.movieId});
}

class GetDataDetailTv extends DetailEvent {
  final String language;
  final int tvId;
  GetDataDetailTv({required this.language, required this.tvId});
}

class GetTvSeason extends DetailEvent {
  final String language;
  final int tvId;
  final int season;
  GetTvSeason({
    required this.language,
    required this.tvId,
    required this.season,
  });
}
