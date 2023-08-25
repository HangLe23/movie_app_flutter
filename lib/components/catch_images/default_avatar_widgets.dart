import 'package:flutter/material.dart';

import 'text_avatar.dart';

class DefaultProfileAvatar extends StatelessWidget {
  const DefaultProfileAvatar({
    Key? key,
    required this.name,
    this.shape = Shape.circular,
  }) : super(key: key);

  final String? name;
  final Shape shape;

  @override
  Widget build(BuildContext context) {
    return name?.isNotEmpty ?? false
        ? TextAvatar(
            text: name,
            shape: shape,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 76,
              fontWeight: FontWeight.bold,
            ),
            upperCase: true,
          )
        : Container();
  }
}
