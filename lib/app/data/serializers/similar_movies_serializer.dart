import 'dart:convert';

import 'package:detailsmovie/app/domain/entities/similar_movies.dart';

class SimilarMoviesSerializer implements SimilarMovies {
  final String data;
  final String image;
  final String title;

  SimilarMoviesSerializer({this.data, this.image, this.title});

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'image': image,
      'title': title,
    };
  }

  factory SimilarMoviesSerializer.fromMap(Map<String, dynamic> map) {
    return SimilarMoviesSerializer(
      data: map['release_date'] ?? '',
      image: map['poster_path'] ?? '',
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SimilarMoviesSerializer.fromJson(String source) =>
      SimilarMoviesSerializer.fromMap(json.decode(source));
}
