part of 'movie_bloc.dart';

@immutable
abstract class MovieState {
  final ListResponse<MovieModel>? movies;
  final String? error;
  const MovieState({this.movies, this.error});
}

final class MovieInitial extends MovieState {}

final class LoadMovie extends MovieState {}

final class ListMovie extends MovieState {
  const ListMovie({required super.movies, super.error});
}

final class MovieError extends MovieState {
  const MovieError({required super.movies, super.error});
}
