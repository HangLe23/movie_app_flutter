part of 'navigationbar_bloc.dart';

@immutable
abstract class NavigationbarEvent {}

class TabChange extends NavigationbarEvent {
  final int index;
  TabChange({required this.index});
}
