part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class SwitchScreen extends DetailEvent {
  final BuildContext context;
  final CastCrew castCrew;
  SwitchScreen(this.castCrew, {required this.context});
}
