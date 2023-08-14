import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/blocs/authentication/authen_bloc.dart';
import 'package:the_movie/reponsitories/authen_repo.dart';
import 'package:the_movie/screens/authentication/login.dart';
import 'package:the_movie/screens/main/main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenRepository(),
      child: BlocProvider(
        create: (context) =>
            AuthenBloc(RepositoryProvider.of<AuthenRepository>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MAinApp(snapshot.data!);
                }
                return const Login();
              }),
        ),
      ),
    );
  }
}
