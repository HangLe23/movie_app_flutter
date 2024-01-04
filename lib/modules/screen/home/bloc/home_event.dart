part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetTopRate extends HomeEvent {
  final String language;
  final int page;
  final String region;
  GetTopRate(
      {required this.language, required this.page, required this.region});
}

class GetVideo extends HomeEvent {
  final int movieId;
  GetVideo({required this.movieId});
}

class LoadMoreTopRate extends HomeEvent {
  final String language;
  final int page;
  final String region;
  LoadMoreTopRate(
      {required this.language, required this.page, required this.region});
}

class RefreshTopRate extends HomeEvent {
  final String language;
  final int page;
  final String region;
  RefreshTopRate(
      {required this.language, required this.region, required this.page});
}
