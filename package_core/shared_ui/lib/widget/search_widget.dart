import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_ui/index.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController textedit;
  final String hint;
  final Color color;
  final Function(String) function;

  const SearchWidget({
    super.key,
    required this.textedit,
    required this.hint,
    required this.color,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275.h,
      height: 45.w,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: Colors.white),
          color: color),
      child: TextField(
        onSubmitted: (query) {
          function(query); // Gọi hàm khi có thay đổi văn bản
        },
        controller: textedit,
        style: TextStyles.lato400Size20,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.all(10),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
