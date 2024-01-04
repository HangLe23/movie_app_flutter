part of 'cast_drew_bloc.dart';

@immutable
abstract class CastCrewEvent {}

class GetDataCastCrew extends CastCrewEvent {
  final String language;
  final int movieId;
  GetDataCastCrew({required this.language, required this.movieId});
}
