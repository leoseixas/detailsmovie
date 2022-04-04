import 'package:dartz/dartz.dart';
import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/domain/entities/movie.dart';
import 'package:detailsmovie/app/domain/entities/similar_movies.dart';
import 'package:detailsmovie/app/domain/repositories/movie_repository.dart';
import 'package:detailsmovie/app/domain/services/movie_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  final service = MovieServiceImpl(repository: repository);

  Movie movie = Movie('titulo', 'image', 1, 1);

  SimilarMovies similarMovies1 = SimilarMovies(
    title: 'teste',
    image: 'teste',
  );
  SimilarMovies similarMovies2 = SimilarMovies(
    title: 'teste',
    image: 'teste',
  );
  SimilarMovies similarMovies3 = SimilarMovies(
    title: 'teste',
    image: 'teste',
  );

  List<SimilarMovies> list = [similarMovies1, similarMovies2, similarMovies3];

  test('must return a movie object ', () async {
    when(repository.getDetailsMovie()).thenAnswer((_) async => Right(movie));

    final result = await service.getDetailsMovie();
    expect(result.fold((l) => l, (r) => r), isA<Movie>());
  });

  test('Must return error in find movie', () async {
    when(repository.getDetailsMovie())
        .thenAnswer((_) async => Left(ErrorFindDetailsMovie()));
    final result = await service.getDetailsMovie();
    expect(result.fold((l) => l, (r) => r), isA<ErrorFindDetailsMovie>());
  });

  test('Must return a list similar movie', () async {
    when(repository.getListSimilarMovies())
        .thenAnswer((_) async => Right(list));

    final result = await service.getListSimilarMovies();
    expect(result.fold((l) => l, (r) => r), isA<List<SimilarMovies>>());
  });

  test('Must return error in find list similar movie', () async {
    when(repository.getListSimilarMovies())
        .thenAnswer((_) async => Left(ErrorFindListSimilarMovie()));
    final result = await service.getListSimilarMovies();
    expect(result.fold((l) => l, (r) => r), isA<ErrorFindListSimilarMovie>());
  });
}
