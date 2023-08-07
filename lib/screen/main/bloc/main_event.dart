part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class TabChange extends MainEvent {
  final int index;
  TabChange({required this.index});
}
