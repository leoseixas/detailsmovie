import 'package:detailsmovie/app/core/constants/api_keys.dart';
import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/data/serializers/movie_serializer.dart';
import 'package:dio/dio.dart';

abstract class MovieGateway {
  Future<MovieSerializer> getDetailsMovie();
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
}
