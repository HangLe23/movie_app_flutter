import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/api_server/api.dart';
import 'package:movie_app_flutter/models/movie.dart';

class MovieAPI {
  static const topratedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=ee0cd15f62401e41fb50547221013e76';

  Future<List<Movies>> getMovies() async {
    final response = await http.get(Uri.parse(topratedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      final moviesList = decodedData.map<Movies>((json) {
        final posterPath = json['poster_path'] as String?;
        final imageUrl = '${API.imgPath}$posterPath';
        return Movies.fromJson(json)..posterPath = imageUrl;
      }).toList();
      return moviesList;
    } else {
      throw Exception('Something happened');
    }
  }

  Future<Movies> fetchMovieDetails(int id) async {
    final response = await http.get(Uri.parse(topratedUrl));
    if (response.statusCode == 200) {
      // Parse the response and return the detailed TopRated object
      // You'll need to adapt this to your specific API response structure
      final Map<String, dynamic> data = json.decode(response.body);
      return Movies.fromJson(data);
    } else {
      throw Exception('Failed to load top rated details');
    }
  }
}
