import 'package:dartz/dartz.dart';
import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/domain/entities/movie.dart';
import 'package:detailsmovie/app/domain/entities/similar_movies.dart';
import 'package:detailsmovie/app/domain/repositories/movie_repository.dart';

abstract class MovieService {
  Future<Either<ErrorFindDetailsMovie, Movie>> getDetailsMovie();

  Future<Either<ErrorFindListSimilarMovie, List<SimilarMovies>>>
      getListSimilarMovies();
}

class MovieServiceImpl implements MovieService {
  final MovieRepository repository;

  MovieServiceImpl({this.repository});

  @override
  Future<Either<ErrorFindDetailsMovie, Movie>> getDetailsMovie() async {
    ErrorFindDetailsMovie errorFindDetailsMovie;
    Movie movie;

    final result = await repository.getDetailsMovie();
    result.fold((l) => {errorFindDetailsMovie = l}, (r) => {movie = r});

    if (result.isRight()) {
      return Right(movie);
    } else {
      return Left(errorFindDetailsMovie);
    }
  }

  @override
  Future<Either<ErrorFindListSimilarMovie, List<SimilarMovies>>>
      getListSimilarMovies() async {
    List<SimilarMovies> listSimilarMovies = [];
    ErrorFindListSimilarMovie errorFindListSimilarMovie;

    final result = await repository.getListSimilarMovies();
    result.fold((l) => errorFindListSimilarMovie = l, (r) {
      for (var list in r) {
        listSimilarMovies.add(list);
      }
    });

    if (result.isRight()) {
      return Right(listSimilarMovies);
    } else {
      return Left(errorFindListSimilarMovie);
    }
  }
}
