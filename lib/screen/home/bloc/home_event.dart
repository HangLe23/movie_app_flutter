part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ItemSelected extends HomeEvent {
  final int index;
  ItemSelected({required this.index});
}
