import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class DetailGenre extends StatelessWidget {
  final List<Genre>? genre;
  const DetailGenre({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Genre', style: TextStyles.lato500Size19),
          SizedBox(height: 5.w),
          GenreListWidget(genres: genre),
        ],
      ),
    );
  }
}
