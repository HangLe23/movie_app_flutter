import 'package:flutter/material.dart';
import 'package:movie_app_flutter/mock_data/mock_data.dart';
import 'package:movie_app_flutter/widget/searchWidget.dart';

import '../../items/cast_drew_item.dart';
import '../../untils/Colors/colors.dart';
import '../../untils/TextStyles/TextStyles.dart';

class CastAndDrew extends StatefulWidget {
  const CastAndDrew({super.key});

  @override
  State<CastAndDrew> createState() => _CastAndDrewState();
}

class _CastAndDrewState extends State<CastAndDrew> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF15141f),
        appBar: AppBar(
          title: Text(
            'Cast & Drew ',
            style: TextStyles.tittle,
          ),
          backgroundColor: Colors.transparent, // Xóa màu nền của AppBar
          elevation: 0, // Xóa đổ bóng của AppBar
        ),
        body: Column(
          children: [
            SearchWidget(
                textedit: search,
                hint: 'Search',
                color: CustomColors.rectangle,
                function: (text) {}),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.7, // Adjust this aspect ratio as needed
                ),
                itemCount: MockData().castDrewItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return CastDrewItem(
                    imageUrl: MockData().castDrewItem[index].imageUrl,
                    name: MockData().castDrewItem[index].name,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
