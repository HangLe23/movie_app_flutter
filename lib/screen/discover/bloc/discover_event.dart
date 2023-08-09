part of 'discover_bloc.dart';

@immutable
abstract class DiscoverEvent {}

class TextChange extends DiscoverEvent {
  final String text;
  TextChange({required this.text});
}
