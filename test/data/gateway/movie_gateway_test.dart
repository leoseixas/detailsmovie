import 'package:detailsmovie/app/core/errors/errors.dart';
import 'package:detailsmovie/app/data/gateway/movie_gateway.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final gateway = MovieGatewayImpl(dio: dio);

  test('must return a movie object', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: movie(), statusCode: 200, requestOptions: null));
    final future = gateway.getDetailsMovie();
    expect(future, completes);
  });

  test('must return a error in find movie', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: any, statusCode: 406, requestOptions: null));
    final future = gateway.getDetailsMovie();
    expect(future, throwsA(isA<ErrorFindDetailsMovie>()));
  });

  test('must return a list movie similar object', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: listMovieSimilar(), statusCode: 200, requestOptions: null));
    final future = gateway.getListSimilarMovies();
    expect(future, completes);
  });

  test('must return a error in find list movie similar', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: any, statusCode: 406, requestOptions: null));
    final future = gateway.getListSimilarMovies();
    expect(future, throwsA(isA<ErrorFindListSimilarMovie>()));
  });
}

Map<String, dynamic> movie() {
  return {
    'title': 'procurando nemo',
    'poster_path': '/qx0EDGXslJvH4qU3DCTseNUL2wo.jpg',
    'vote_count': 11,
    'popularity': 11
  };
}

Map<String, dynamic> listMovieSimilar() {
  return {
    'results': [
      {
        'release_date': '2010-06-06',
        'poster_path': '/qx0EDGXslJvH4qU3DCTseNUL2wo.jpg',
        'title': 'Procurando dori',
      },
      {
        'release_date': '2010-06-06',
        'poster_path': '/qx0EDGXslJvH4qU3DCTseNUL2wo.jpg',
        'title': 'Procurando dori',
      },
      {
        'release_date': '2010-06-06',
        'poster_path': '/qx0EDGXslJvH4qU3DCTseNUL2wo.jpg',
        'title': 'Procurando dori',
      },
      {
        'release_date': '2010-06-06',
        'poster_path': '/qx0EDGXslJvH4qU3DCTseNUL2wo.jpg',
        'title': 'Procurando dori',
      },
    ],
  };
}
