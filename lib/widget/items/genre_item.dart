import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/model.dart';
import 'package:movie_app_flutter/untils/untils.dart';
import 'package:movie_app_flutter/widget/widget.dart';

class GenreListWidget extends StatelessWidget {
  final List<Genre>? genres;

  const GenreListWidget({Key? key, this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: genres?.map((genre) {
            return CardWidget(
              widget: Center(
                child: Text(
                  genre.name ?? '',
                  style: TextStyles.decription,
                ),
              ),
              radius: 18,
              width: 75,
              height: 30,
              color: CustomColors.rectangle,
            );
          }).toList() ??
          [],
    );
  }
}
