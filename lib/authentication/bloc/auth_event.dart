part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignIn extends AuthEvent {
  final String email, password;
  final BuildContext context;
  SignIn({required this.email, required this.password, required this.context});
}

class SignUp extends AuthEvent {
  final String email, password;
  final BuildContext context;
  SignUp({required this.email, required this.password, required this.context});
}

class GoogleSignIn extends AuthEvent {
  final BuildContext context;
  GoogleSignIn({required this.context});
}

class SignOut extends AuthEvent {
  final BuildContext context;
  SignOut({required this.context});
}
