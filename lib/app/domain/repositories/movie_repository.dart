import 'package:dartz/dartz.dart';
import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<ErrorFindDetailsMovie, Movie>> getDetailsMovie();
}
