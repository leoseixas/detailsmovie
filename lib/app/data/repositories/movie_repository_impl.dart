import 'package:dartz/dartz.dart';
import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/data/gateway/movie_gateway.dart';
import 'package:detailsmovie/app/domain/entities/movie.dart';
import 'package:detailsmovie/app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieGateway movieGateway;

  MovieRepositoryImpl({required this.movieGateway});

  @override
  Future<Either<ErrorFindDetailsMovie, Movie>> getDetailsMovie() async {
    final result = await movieGateway.getDetailsMovie();
    throw UnimplementedError();
  }
}
