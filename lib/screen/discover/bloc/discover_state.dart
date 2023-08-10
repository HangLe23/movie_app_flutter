part of 'discover_bloc.dart';

@immutable
abstract class DiscoverState {
  final int index;
  const DiscoverState({required this.index});
}

final class DiscoverInitial extends DiscoverState {
  const DiscoverInitial({required super.index});
}

final class SerchResult extends DiscoverState {
  final String result;
  const SerchResult({required this.result, required super.index});
}
