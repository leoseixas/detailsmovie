import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/data/gateway/movie_gateway.dart';
import 'package:detailsmovie/app/data/repositories/movie_repository_impl.dart';
import 'package:detailsmovie/app/data/serializers/movie_serializer.dart';
import 'package:detailsmovie/app/data/serializers/similar_movies_serializer.dart';
import 'package:detailsmovie/app/domain/entities/movie.dart';
import 'package:detailsmovie/app/domain/entities/similar_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MovieGatewayMock extends Mock implements MovieGatewayImpl {}

void main() {
  final gateway = MovieGatewayMock();
  final repository = MovieRepositoryImpl(movieGateway: gateway);

  MovieSerializer movie = MovieSerializer('title', 'image', 1, 1);
  SimilarMoviesSerializer movieSerializer1 = SimilarMoviesSerializer(
      data: DateTime.parse('2010-03-03'), image: 'teste', title: 'teste1');
  SimilarMoviesSerializer movieSerializer2 = SimilarMoviesSerializer(
      data: DateTime.parse('2010-03-03'), image: 'teste', title: 'teste1');
  SimilarMoviesSerializer movieSerializer3 = SimilarMoviesSerializer(
      data: DateTime.parse('2010-03-03'), image: 'teste', title: 'teste1');
  List<SimilarMoviesSerializer> listmMovies = [
    movieSerializer1,
    movieSerializer2,
    movieSerializer3
  ];
  // ErrorFindDetailsMovie errorFindDetailsMovie =
  //     ErrorFindDetailsMovie(message: 'erro');

  test('must return a movie object', () async {
    when(gateway.getDetailsMovie()).thenAnswer((_) async => movie);
    final result = await repository.getDetailsMovie();
    expect(result.getOrElse(() => null), isA<Movie>());
  });

  test('must return a error in find movie', () async {
    when(gateway.getDetailsMovie()).thenThrow(ErrorFindDetailsMovie());
    final result = await repository.getDetailsMovie();
    expect(result.fold((l) => l, (r) => r), isA<ErrorFindDetailsMovie>());
  });

  test('Must return a list similar movie', () async {
    when(gateway.getListSimilarMovies()).thenAnswer((_) async => listmMovies);
    final result = await repository.getListSimilarMovies();
    expect(result.getOrElse(() => null), isA<List<SimilarMovies>>());
  });

  test('must return error in list similar movie', () async {
    when(gateway.getListSimilarMovies()).thenThrow(ErrorFindListSimilarMovie());
    final result = await repository.getListSimilarMovies();
    expect(result.fold((l) => l, (r) => r), isA<ErrorFindListSimilarMovie>());
  });
}
