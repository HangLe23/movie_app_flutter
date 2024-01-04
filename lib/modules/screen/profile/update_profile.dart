import 'package:firebase_auth/firebase_auth.dart';

class Update {
  Future<void> updateInformation({
    required String email,
    required String name,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.updateDisplayName(name);
      await user.updateEmail(email);
    }
  }
}
