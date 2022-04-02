import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/domain/entities/movie.dart';
import 'package:detailsmovie/app/domain/services/movie_service.dart';
import 'package:flutter/material.dart';

class DetailsMovieController with ChangeNotifier {
  final MovieServiceImpl service;

  DetailsMovieController({this.service});

  ErrorFindDetailsMovie errorFindDetailsMovie;
  Movie movie;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isFavorite = false;
  bool get isFavotite => _isFavorite;

  Future<void> getDetailsMovie() async {
    _isLoading = true;
    notifyListeners();
    final result = await service.getDetailsMovie();
    result.fold((l) => errorFindDetailsMovie = l, (r) => movie = r);
    _isLoading = false;
    notifyListeners();
  }

  void favoriteMove(bool favorite) {
    _isFavorite = !favorite;
    notifyListeners();
  }
}
