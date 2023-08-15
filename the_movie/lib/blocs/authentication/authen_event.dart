part of 'authen_bloc.dart';

@immutable
abstract class AuthenEvent {}

class SignIn extends AuthenEvent {
  final String email, password;
  SignIn(this.email, this.password);
}

class SignUp extends AuthenEvent {
  final String email, password, confirmPass;
  SignUp(this.email, this.password, this.confirmPass);
}

class GoogleSignIn extends AuthenEvent {}

class SignOut extends AuthenEvent {}
