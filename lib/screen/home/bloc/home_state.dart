part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadSelect extends HomeState {}

final class Selected extends HomeState {}
