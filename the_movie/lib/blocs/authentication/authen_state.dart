part of 'authen_bloc.dart';

@immutable
abstract class AuthenState {}

final class AuthenInitial extends AuthenState {}

class Loading extends AuthenState {}

class Authenticated extends AuthenState {
  final User user;
  Authenticated(this.user);
}

class AuthenError extends AuthenState {
  final String error;
  AuthenError(this.error);
}
