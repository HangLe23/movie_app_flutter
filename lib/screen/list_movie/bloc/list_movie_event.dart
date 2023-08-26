part of 'list_movie_bloc.dart';

@immutable
abstract class ListMovieEvent {}

class Init extends ListMovieEvent {}

class GetData extends ListMovieEvent {
  final String language;
  final int page;
  final String region;
  GetData({required this.language, required this.page, required this.region});
}
