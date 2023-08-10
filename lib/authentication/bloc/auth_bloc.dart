import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/authentication/authen_service.dart';
import 'package:movie_app_flutter/authentication/login/login.dart';

import '../../screen/main/mainapp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignIn>((event, emit) async {
      emit(Loading());
      await AuthenServiceOnTap()
          .signIn(email: event.email, password: event.password)
          .then((value) {
        Navigator.of(event.context)
            .push(MaterialPageRoute(builder: (context) => const MainApp()));
      });
      emit(Authenticated(
        FirebaseAuth.instance.currentUser!,
      ));
    });
    on<SignUp>(
      (event, emit) async {
        emit(Loading());
        try {
          await AuthenServiceOnTap()
              .signUp(email: event.email, password: event.password);
          emit(Authenticated(FirebaseAuth.instance.currentUser!));
        } catch (e) {
          emit(AuthenError());
          emit(AuthInitial());
        }
      },
    );
    on<GoogleSignIn>(
      (event, emit) async {
        emit(Loading());
        await AuthenServiceOnTap().signInWithGoogle().then((value) {
          Navigator.of(event.context)
              .push(MaterialPageRoute(builder: (context) => const MainApp()));
        });
        emit(Authenticated(FirebaseAuth.instance.currentUser!));
      },
    );
    on<SignOut>(
      (event, emit) async {
        emit(Loading());
        await AuthenServiceOnTap().signOut().then((value) {
          Navigator.of(event.context)
              .push(MaterialPageRoute(builder: (context) => const Login()));
        });
        emit(AuthInitial());
      },
    );
  }
}
