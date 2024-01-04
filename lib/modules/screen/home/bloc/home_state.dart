part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final List<MovieModel>? movies;
  final String? error;
  final int page;
  const HomeState({this.movies, this.error, required this.page});
}

final class HomeInitial extends HomeState {
  const HomeInitial({required super.page});
}

final class LoadHome extends HomeState {
  const LoadHome({required super.page});
}

final class ListTopRate extends HomeState {
  final int pageListMovie;
  const ListTopRate({
    required super.movies,
    super.error,
    required this.pageListMovie,
  }) : super(page: pageListMovie);
}

final class HomeError extends HomeState {
  const HomeError({required super.movies, super.error}) : super(page: 1);
}
