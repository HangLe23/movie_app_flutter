import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/authentication/authen_service.dart';
import 'package:movie_app_flutter/authentication/bloc/auth_bloc.dart';
import 'package:movie_app_flutter/authentication/login/login.dart';
import 'package:movie_app_flutter/screen/main/mainapp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // const MaterialApp(
        //   home: ListMovie(),
        // );
        RepositoryProvider(
            create: (context) => AuthenServiceOnTap(),
            child: BlocProvider(
              create: (context) =>
                  AuthBloc(RepositoryProvider.of<AuthenServiceOnTap>(context)),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.userChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MainApp(snapshot.data!);
                      }
                      return const Login();
                    }),
              ),
            ));
  }
}
