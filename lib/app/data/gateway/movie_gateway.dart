import 'package:detailsmovie/app/core/constants/api_keys.dart';
import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/data/serializers/movie_serializer.dart';
import 'package:detailsmovie/app/data/serializers/similar_movies_serializer.dart';
import 'package:dio/dio.dart';

abstract class MovieGateway {
  Future<MovieSerializer> getDetailsMovie();
  Future<List<SimilarMoviesSerializer>> getListSimilarMovies();
}

class MovieGatewayImpl implements MovieGateway {
  final Dio dio;

  MovieGatewayImpl({this.dio});

  @override
  Future<MovieSerializer> getDetailsMovie() async {
    try {
      final response = await dio
          .get('${ApiKeys.urlBase}12?api_key=${ApiKeys.apiKey}&language=pt-BR');
      final movieSerializer = MovieSerializer.fromMap(response.data);
      return movieSerializer;
    } catch (e) {
      throw ErrorFindDetailsMovie(message: 'Erro ao buscar filme');
    }
  }

  @override
  Future<List<SimilarMoviesSerializer>> getListSimilarMovies() async {
    List<SimilarMoviesSerializer> listSimilarMovies = [];
    try {
      final response = await dio.get(
          '${ApiKeys.urlBase}12/similar?api_key=${ApiKeys.apiKey}&language=pt-BR');
      for (var list in response.data['results']) {
        listSimilarMovies.add(SimilarMoviesSerializer.fromMap(list));
      }
      return listSimilarMovies;
    } catch (e) {
      throw ErrorFindListSimilarMovie(
          message: 'Erro ao buscar lista de filmes similares');
    }
  }
}
