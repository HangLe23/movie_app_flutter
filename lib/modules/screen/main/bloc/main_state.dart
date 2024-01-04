part of 'main_bloc.dart';

@immutable
abstract class MainState {
  final int tabIndex;

  const MainState({required this.tabIndex});
}

class MainInitial extends MainState {
  const MainInitial({required super.tabIndex});
}
