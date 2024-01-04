part of 'movie_bloc.dart';

@immutable
abstract class MovieState {
  final List<MovieModel>? movies;
  final String? error;
  final int page;
  const MovieState({this.movies, this.error, required this.page});
}

final class MovieInitial extends MovieState {
  const MovieInitial({required super.page});
}

final class LoadMovie extends MovieState {
  const LoadMovie({required super.page});
}

final class ListMovie extends MovieState {
  final int pageListMovie;
  const ListMovie(
      {required super.movies, super.error, required this.pageListMovie})
      : super(page: pageListMovie);
}

final class MovieError extends MovieState {
  const MovieError({required super.movies, super.error}) : super(page: 1);
}

final class EmptyData extends MovieState {
  const EmptyData({required super.movies, super.error}) : super(page: 1);
}
