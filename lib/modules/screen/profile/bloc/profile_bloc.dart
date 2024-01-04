import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../update_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<UpdateProfile>((event, emit) async {
      emit(LoadUpdate());
      await Update().updateInformation(email: event.email, name: event.name);
      emit(Success(
        FirebaseAuth.instance.currentUser!,
      ));
    });
  }
}
