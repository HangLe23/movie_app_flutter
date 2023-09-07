class TvSeasonDetail {
  TvSeasonDetail({
    this.idString,
    this.airDate,
    //this.episodes,
    this.name,
    this.overview,
    this.id,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });
  String? idString;
  String? airDate;
  //List<Episodes>? episodes;
  String? name;
  String? overview;
  int? id;
  String? posterPath;
  int? seasonNumber;
  num? voteAverage;

  TvSeasonDetail.fromJson(Map<String, dynamic> json) {
    idString = json['_id'];
    airDate = json['air_date'];
    // episodes =
    //     List.from(json['episodes']).map((e) => Episodes.fromJson(e)).toList();
    name = json['name'];
    overview = json['overview'];
    id = json['id'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = idString;
    data['air_date'] = airDate;
    //data['episodes'] = episodes;
    data['name'] = name;
    data['overview'] = overview;
    data['id'] = id;
    data['poster_path'] = posterPath;
    data['season_number'] = seasonNumber;
    data['vote_average'] = voteAverage;
    return data;
  }
}

class Episodes {
  Episodes({
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
    this.crew,
    this.guestStars,
  });
  String? airDate;
  int? episodeNumber;
  String? episodeType;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  String? stillPath;
  int? voteAverage;
  int? voteCount;
  List<dynamic>? crew;
  List<GuestStars>? guestStars;

  Episodes.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    episodeType = json['episode_type'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    productionCode = json['production_code'];
    runtime = null;
    seasonNumber = json['season_number'];
    showId = json['show_id'];
    stillPath = null;
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    crew = List.castFrom<dynamic, dynamic>(json['crew']);
    guestStars = List.from(json['guest_stars'])
        .map((e) => GuestStars.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['air_date'] = airDate;
    data['episode_number'] = episodeNumber;
    data['episode_type'] = episodeType;
    data['id'] = id;
    data['name'] = name;
    data['overview'] = overview;
    data['production_code'] = productionCode;
    data['runtime'] = runtime;
    data['season_number'] = seasonNumber;
    data['show_id'] = showId;
    data['still_path'] = stillPath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['crew'] = crew;
    data['guest_stars'] = guestStars;
    return data;
  }
}

class GuestStars {
  GuestStars({
    this.character,
    this.creditId,
    this.order,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  });
  String? character;
  String? creditId;
  int? order;
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;

  GuestStars.fromJson(Map<String, dynamic> json) {
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    return data;
  }
}
