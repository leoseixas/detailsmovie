import 'package:dartz/dartz.dart';
import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/data/gateway/movie_gateway.dart';
import 'package:detailsmovie/app/domain/entities/movie.dart';
import 'package:detailsmovie/app/domain/entities/similar_movies.dart';
import 'package:detailsmovie/app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieGateway movieGateway;

  MovieRepositoryImpl({this.movieGateway});

  @override
  Future<Either<ErrorFindDetailsMovie, Movie>> getDetailsMovie() async {
    try {
      final result = await movieGateway.getDetailsMovie();
      final movie =
          Movie(result.title, result.image, result.like, result.popularity);
      return Right(movie);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ErrorFindListSimilarMovie, List<SimilarMovies>>>
      getListSimilarMovies() async {
    List<SimilarMovies> listSimilarMovies = [];
    try {
      final result = await movieGateway.getListSimilarMovies();
      for (var list in result) {
        SimilarMovies movies = SimilarMovies(
          title: list.title,
          image: list.image,
          data: list.data,
        );
        listSimilarMovies.add(movies);
      }
      return Right(listSimilarMovies);
    } catch (e) {
      return Left(e);
    }
  }
}
