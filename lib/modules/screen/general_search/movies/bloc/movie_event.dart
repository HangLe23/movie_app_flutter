part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class GetMovie extends MovieEvent {
  final String language;
  final int page;
  final String region;
  GetMovie({required this.language, required this.page, required this.region});
}

class GetRecommendation extends MovieEvent {
  final String language;
  final int page;
  final int movieId;
  GetRecommendation(
      {required this.language, required this.page, required this.movieId});
}

class LoadMore extends MovieEvent {
  final String language;
  final int page;
  final String region;
  LoadMore({required this.language, required this.page, required this.region});
}

class RefreshPage extends MovieEvent {
  final String language;
  final int page;
  final String region;
  RefreshPage(
      {required this.language, required this.region, required this.page});
}
