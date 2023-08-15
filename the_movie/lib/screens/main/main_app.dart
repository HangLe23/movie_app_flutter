import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  final User user;
  const MainApp(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Main'),
    );
  }
}
