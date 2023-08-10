import 'package:flutter/material.dart';

import '../../../untils/TextStyles/TextStyles.dart';

class TVSeriesScreen extends StatefulWidget {
  const TVSeriesScreen({super.key});

  @override
  State<TVSeriesScreen> createState() => _TVSeriesScreenState();
}

class _TVSeriesScreenState extends State<TVSeriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('TV Series Screen', style: TextStyles.lato400Size19),
    );
  }
}
