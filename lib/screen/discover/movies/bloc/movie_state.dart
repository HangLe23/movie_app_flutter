part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

final class MovieInitial extends MovieState {}

final class MoviesLoaded extends MovieState {
  final List<Movies> data;
  MoviesLoaded(this.data);
}
