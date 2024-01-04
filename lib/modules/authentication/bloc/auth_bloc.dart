import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/modules/index.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthenServiceOnTap of) : super(AuthInitial()) {
    on<SignIn>((event, emit) async {
      emit(Loading());
      try {
        await AuthenServiceOnTap()
            .signIn(email: event.email, password: event.password);
        emit(Authenticated(FirebaseAuth.instance.currentUser!));
      } catch (e) {
        emit(AuthenError(e.toString()));
        emit(AuthInitial());
      }
    });
    on<SignUp>((event, emit) async {
      emit(Loading());
      try {
        await AuthenServiceOnTap().signUp(
            email: event.email,
            password: event.password,
            confirm: event.confirmPas);
        emit(Authenticated(FirebaseAuth.instance.currentUser!));
      } catch (e) {
        emit(AuthenError(e.toString()));
        emit(AuthInitial());
      }
    });
    on<GoogleSignIn>((event, emit) async {
      emit(Loading());
      try {
        await AuthenServiceOnTap().signInWithGoogle();
        emit(Authenticated(FirebaseAuth.instance.currentUser!));
      } catch (e) {
        emit(AuthenError(e.toString()));
        emit(AuthInitial());
      }
    });
    on<SignOut>((event, emit) async {
      emit(Loading());
      try {
        await AuthenServiceOnTap().signOut();
      } catch (e) {
        emit(AuthInitial());
      }
    });
  }
}
