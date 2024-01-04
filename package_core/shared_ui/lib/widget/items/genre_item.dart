import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

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
              radius: 18.r,
              width: 70.h,
              height: 30.w,
              color: CustomColors.rectangle,
            );
          }).toList() ??
          [],
    );
  }
}
