part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class SwitchScreen extends DetailEvent {
  final BuildContext context;
  SwitchScreen({required this.context});
}
