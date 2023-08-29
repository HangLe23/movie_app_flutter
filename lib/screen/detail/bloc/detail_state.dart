part of 'detail_bloc.dart';

@immutable
abstract class DetailState {
  final ObjectResponse<Detail>? details;
  final String? error;
  const DetailState({this.details, this.error});
}

class DetailInitial extends DetailState {}

final class LoadDetail extends DetailState {}

final class ListDataDetail extends DetailState {
  const ListDataDetail({required super.details, super.error});
}

final class DetailError extends DetailState {
  const DetailError({required super.details, super.error});
}
