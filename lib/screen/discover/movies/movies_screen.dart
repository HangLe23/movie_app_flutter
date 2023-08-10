import 'package:flutter/material.dart';

import '../../../items/movie_item.dart';
import '../../../mock_data/mock_data.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.7, // Adjust this aspect ratio as needed
      ),
      itemCount: MockData().movieItems.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieItem(
          imageUrl: MockData().movieItems[index].imageUrl,
          name: MockData().movieItems[index].name,
        );
      },
    );
  }
}
