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
      throw Left(ErrorFindDetailsMovie(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorFindDetailsMovie, List<SimilarMovies>>>
      getListSimilarMovies() {
    // TODO: implement getListSimilarMovies
    throw UnimplementedError();
  }
}
