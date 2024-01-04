part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class BottomTabChange extends MainEvent {
  final int index;
  BottomTabChange({required this.index});
}
