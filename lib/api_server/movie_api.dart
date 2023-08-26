import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/api_server/api.dart';
import 'package:movie_app_flutter/models/cast_crew.dart';
import 'package:movie_app_flutter/models/detail.dart';
import 'package:movie_app_flutter/models/movie.dart';

class MovieAPI {
  static const movieURL =
      '${AppConstants.baseUrl}/trending/movie/day?AppConstants_key=${AppConstants.api}';

  static const topratedUrl =
      '${AppConstants.baseUrl}/movie/top_rated?AppConstants_key=${AppConstants.api}';

  Future<List<Movies>> getMovies() async {
    final response = await http.get(Uri.parse(movieURL));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      final moviesList = decodedData.map<Movies>((json) {
        final posterPath = json['poster_path'] as String?;
        final imageUrl = '${AppConstants.imgPath}$posterPath';
        return Movies.fromJson(json)..posterPath = imageUrl;
      }).toList();
      return moviesList;
    } else {
      throw Exception('Something happened');
    }
  }

  Future<Detail> fetchMovieDetails(int id) async {
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}/movie/$id?AppConstants_key=${AppConstants.api}'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Detail.fromJson(data);
    } else {
      throw Exception('Failed to load details');
    }
  }

  Future<List<Movies>> getTopRates() async {
    final response = await http.get(Uri.parse(topratedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      final topRatedList = decodedData.map<Movies>((json) {
        final posterPath = json['poster_path'] as String?;
        final imageUrl = '${AppConstants.imgPath}$posterPath';
        return Movies.fromJson(json)..posterPath = imageUrl;
      }).toList();
      return topRatedList;
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<CastCrew>> getCastCrew(int id) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppConstants.baseUrl}/movie/$id/casts?AppConstants_key=${AppConstants.api}'));

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['cast'] as List;
        final decodedCrewData = json.decode(response.body)['crew'] as List;

        final castList = decodedData.map<Cast>((json) {
          final profilePath = json['profile_path'] as String?;
          final imageUrl = '${AppConstants.imgPath}$profilePath';
          return Cast.fromJson(json)..profilePath = imageUrl;
        }).toList();

        final crewList = decodedCrewData.map<Crew>((json) {
          final profilePath = json['profile_path'] as String?;
          final imageUrl = '${AppConstants.imgPath}$profilePath';
          return Crew.fromJson(json)..profilePath = imageUrl;
        }).toList();

        return [CastCrew(cast: castList, crew: crewList)];
      } else {
        throw Exception(
            'AppConstants request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      //print('Error fetching cast and crew: $error');
      return [CastCrew(cast: [], crew: [])];
    }
  }

  Future<CastCrew> fetchCastCrew(int id) async {
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}/movie/$id/casts?AppConstants_key=${AppConstants.api}'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return CastCrew.fromJson(data);
    } else {
      throw Exception('Failed to load details');
    }
  }
}
