class NowShowing {
  int? id;
  String? title;
  String? overview;
  String? posterPath;
  String? backdropPath;
  List? genres;

  NowShowing({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.genres,
  });

  factory NowShowing.fromJson(Map<String, dynamic> json) {
    return NowShowing(
      id: json['id']?.toInt(),
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      genres: json['genre_ids'],
    );
  }
}
