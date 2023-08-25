import 'package:movie_app_flutter/models/cast_crew.dart';

class AutoGenerate {
  AutoGenerate({
    this.cast,
    this.crew,
    this.id,
  });
  List<Cast>? cast;
  List<Crew>? crew;
  int? id;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    cast = List.from(json['cast']).map((e) => Cast.fromJson(e)).toList();
    crew = List.from(json['crew']).map((e) => Crew.fromJson(e)).toList();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cast'] = cast?.map((e) => e.toJson()).toList();
    data['crew'] = crew?.map((e) => e.toJson()).toList();
    data['id'] = id;
    return data;
  }
}

class Cast {
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.character,
    this.creditId,
    this.order,
  });
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? character;
  String? creditId;
  int? order;

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    return data;
  }
}
