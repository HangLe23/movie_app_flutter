part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignIn extends AuthEvent {
  final String email, password;
  SignIn(this.email, this.password);
}

class SignUp extends AuthEvent {
  final String email, password, confirmPas;
  SignUp(this.email, this.password, this.confirmPas);
}

class GoogleSignIn extends AuthEvent {}

class SignOut extends AuthEvent {}
