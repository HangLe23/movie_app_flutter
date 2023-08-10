part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class UpdateItemMovie extends MovieEvent {
  final List<Movies> data;
  UpdateItemMovie(this.data);
}
