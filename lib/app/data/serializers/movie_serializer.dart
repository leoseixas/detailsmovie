import 'dart:convert';

import 'package:detailsmovie/app/domain/entities/movie.dart';

class MovieSerializer implements Movie {
  @override
  final String title;
  @override
  final String image;
  @override
  final double like;
  @override
  final double popularity;

  MovieSerializer(this.title, this.image, this.like, this.popularity);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'like': like,
      'popularity': popularity,
    };
  }

  factory MovieSerializer.fromMap(Map<String, dynamic> map) {
    return MovieSerializer(
      map['title'] ?? '',
      map['image'] ?? '',
      map['like']?.toDouble() ?? 0.0,
      map['popularity']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieSerializer.fromJson(String source) =>
      MovieSerializer.fromMap(json.decode(source));
}
