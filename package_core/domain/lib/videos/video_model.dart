class VideoItem {
  VideoItem({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key, // Add the key field for YouTube video key
    this.publishedAt,
    this.site,
    this.size,
    this.type,
    this.official,
    this.id,
  });

  String? iso6391;
  String? iso31661;
  String? name;
  String? key; // YouTube video key
  String? publishedAt;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? id;

  VideoItem.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key']; // Parse the YouTube video key
    publishedAt = json['published_at'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    id = json['id'];
  }
}
