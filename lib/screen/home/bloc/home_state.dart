part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final ListResponse<MovieModel>? movies;
  final String? error;
  const HomeState({this.movies, this.error});
}

final class HomeInitial extends HomeState {}

final class LoadHome extends HomeState {}

final class ListTopRate extends HomeState {
  const ListTopRate({required super.movies, super.error});
}

final class HomeError extends HomeState {
  const HomeError({required super.movies, super.error});
}
