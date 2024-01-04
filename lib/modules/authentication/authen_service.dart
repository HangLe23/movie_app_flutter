import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenServiceOnTap {
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String confirm}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      password = confirm;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('This password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
