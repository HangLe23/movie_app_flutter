import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/models/top_rate.dart';

class TopRatedAPI {
  static const imgPath = 'https://image.tmdb.org/t/p/w500';
  static const topratedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=ee0cd15f62401e41fb50547221013e76';

  Future<List<TopRated>> getTopRates() async {
    final response = await http.get(Uri.parse(topratedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      final topRatedList = decodedData.map<TopRated>((json) {
        final posterPath = json['poster_path'] as String?;
        final imageUrl = '$imgPath$posterPath';
        return TopRated.fromJson(json)..posterPath = imageUrl;
      }).toList();
      return topRatedList;
    } else {
      throw Exception('Something happened');
    }
  }

  Future<TopRated> fetchTopRatedDetails(int id) async {
    final response = await http.get(Uri.parse(topratedUrl));
    if (response.statusCode == 200) {
      // Parse the response and return the detailed TopRated object
      // You'll need to adapt this to your specific API response structure
      final Map<String, dynamic> data = json.decode(response.body);
      return TopRated.fromJson(data);
    } else {
      throw Exception('Failed to load top rated details');
    }
  }
}
