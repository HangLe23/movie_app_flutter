part of 'cast_drew_bloc.dart';

@immutable
abstract class CastCrewState {
  final ObjectResponse<CastCrew>? casts;
  final String? error;
  const CastCrewState({this.casts, this.error});
}

class CastCrewInitial extends CastCrewState {}

final class LoadCastCrew extends CastCrewState {}

final class ListDataCastCrew extends CastCrewState {
  const ListDataCastCrew({required super.casts, super.error});
}

final class CastCrewError extends CastCrewState {
  const CastCrewError({required super.casts, super.error});
}
