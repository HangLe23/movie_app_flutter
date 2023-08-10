import 'package:flutter/material.dart';

import '../../../untils/TextStyles/TextStyles.dart';

class DocumentaryScreen extends StatefulWidget {
  const DocumentaryScreen({super.key});

  @override
  State<DocumentaryScreen> createState() => _DocumentaryScreenState();
}

class _DocumentaryScreenState extends State<DocumentaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Documentary Screen', style: TextStyles.lato400Size19),
    );
  }
}
