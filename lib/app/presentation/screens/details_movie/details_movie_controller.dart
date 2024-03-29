import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/domain/entities/movie.dart';
import 'package:detailsmovie/app/domain/entities/similar_movies.dart';
import 'package:detailsmovie/app/domain/services/movie_service.dart';
import 'package:flutter/material.dart';

class DetailsMovieController with ChangeNotifier {
  final MovieServiceImpl service;

  DetailsMovieController({this.service});

  final pageController = PageController(initialPage: 0);

  ErrorFindDetailsMovie errorFindDetailsMovie;
  ErrorFindListSimilarMovie errorFindListSimilarMovie;

  Movie movie;
  List<SimilarMovies> listSimilarMovies;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  bool _isFailureFindMovie = false;
  bool get isFailureFindMovie => _isFailureFindMovie;

  bool _isFailureFindListMovie = false;
  bool get isFailureFindListMovie => _isFailureFindListMovie;

  Future<void> initializerScreen() async {
    _isLoading = true;
    notifyListeners();
    await getDetailsMovie();
    await getListSimilarMovies();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getDetailsMovie() async {
    final result = await service.getDetailsMovie();
    result.fold((l) {
      errorFindDetailsMovie = l;
      _isFailureFindMovie = true;
    }, (r) => movie = r);
    notifyListeners();
  }

  Future<void> getListSimilarMovies() async {
    final result = await service.getListSimilarMovies();
    result.fold((l) {
      errorFindListSimilarMovie = l;
      _isFailureFindListMovie = true;
    }, (r) => listSimilarMovies = r);
    notifyListeners();
  }

  void favoriteMove(bool favorite) {
    _isFavorite = !favorite;
    notifyListeners();
  }
}
