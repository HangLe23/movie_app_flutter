part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetTopRate extends HomeEvent {
  final String language;
  final int page;
  final String region;
  GetTopRate(
      {required this.language, required this.page, required this.region});
}
