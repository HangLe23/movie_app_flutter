part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

class AuthenError extends AuthState {
  final String error;
  AuthenError(this.error);
}

class Loading extends AuthState {}
