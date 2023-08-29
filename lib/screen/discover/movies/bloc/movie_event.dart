part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class GetMovie extends MovieEvent {
  final String language;
  final int page;
  final String region;
  GetMovie({required this.language, required this.page, required this.region});
}
