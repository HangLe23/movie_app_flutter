part of 'navigationbar_bloc.dart';

@immutable
abstract class NavigationbarState {
  final int index;
  const NavigationbarState(this.index);
}

final class NavigationbarInitial extends NavigationbarState {
  const NavigationbarInitial(super.index);
}
