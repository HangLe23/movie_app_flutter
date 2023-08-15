import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:the_movie/reponsitories/authen_repo.dart';

part 'authen_event.dart';
part 'authen_state.dart';

class AuthenBloc extends Bloc<AuthenEvent, AuthenState> {
  AuthenBloc(AuthenRepository of) : super(AuthenInitial()) {
    on<SignIn>((event, emit) async {
      emit(Loading());
      try {
        await AuthenRepository()
            .signIn(email: event.email, password: event.password);
      } catch (e) {
        emit(AuthenError(e.toString()));
        emit(AuthenInitial());
      }
    });
    on<SignUp>((event, emit) async {
      emit(Loading());
      try {
        await AuthenRepository().signUp(
            email: event.email,
            password: event.password,
            confirm: event.confirmPass);
      } catch (e) {
        emit(AuthenError(e.toString()));
        emit(AuthenInitial());
      }
    });
    on<GoogleSignIn>((event, emit) async {
      emit(Loading());
      try {
        await AuthenRepository().signInWithGoogle();
      } catch (e) {
        emit(AuthenError(e.toString()));
        emit(AuthenInitial());
      }
    });
    on<SignOut>((event, emit) async {
      emit(Loading());
      try {
        await AuthenRepository().signOut();
      } catch (e) {
        emit(AuthenError(e.toString()));
        emit(AuthenInitial());
      }
    });
  }
}
