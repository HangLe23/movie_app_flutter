part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class GetDataDetail extends DetailEvent {
  final String language;
  final int movieId;
  GetDataDetail({required this.language, required this.movieId});
}
