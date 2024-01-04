import 'package:flutter/material.dart';
import 'package:shared_ui/index.dart';

class SportScreen extends StatefulWidget {
  const SportScreen({super.key});

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Sport Screen', style: TextStyles.lato400Size19),
    );
  }
}
