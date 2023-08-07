part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class SwitchScreen extends DetailEvent {
  final String ischange;
  SwitchScreen({required this.ischange});
}
