part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String name, email;
  UpdateProfile({required this.name, required this.email});
}
