import 'dart:convert';

class PopularModel {
  int? id;
  String? backDropPath;
  String? title;
  String? overview;
  String? rating;
  List? genre;
  String? posterPath;

  PopularModel({
    this.id,
    this.backDropPath,
    this.title,
    this.overview,
    this.rating,
    this.genre,
    this.posterPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'backDropPath': backDropPath,
      'title': title,
      'overview': overview,
      'rating': rating,
      'genre': genre,
      'posterPath': posterPath,
    };
  }

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
      id: json['id']?.toInt(),
      backDropPath: json['backDrop_path'],
      title: json['title'],
      overview: json['overview'],
      rating: json['vote_average'].toString(),
      posterPath: json['poster_path'],
      genre: json['genre_ids'],
    );
  }
}
