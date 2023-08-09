part of 'discover_bloc.dart';

@immutable
abstract class DiscoverState {}

final class DiscoverInitial extends DiscoverState {}

final class SerchResult extends DiscoverState {
  final String result;
  SerchResult({required this.result});
}
