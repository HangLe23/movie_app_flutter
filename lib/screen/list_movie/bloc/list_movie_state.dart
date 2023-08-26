part of 'list_movie_bloc.dart';

@immutable
abstract class ListMovieState {
  ListResponse<MovieModel>? movies;
  String? error;
  ListMovieState({this.movies, this.error});
}

final class ListMovieInitial extends ListMovieState {}

final class ListData extends ListMovieState {
  ListData({required super.movies, super.error});
}

final class ListError extends ListMovieState {
  ListError({required super.movies, super.error});
}
