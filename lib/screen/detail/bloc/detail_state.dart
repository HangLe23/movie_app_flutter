part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class Switched extends DetailState {}

class LoadSwitch extends DetailInitial {}
