part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

class LoadUpdate extends ProfileState {}

class Success extends ProfileState {
  final User user;
  Success(this.user);
}
