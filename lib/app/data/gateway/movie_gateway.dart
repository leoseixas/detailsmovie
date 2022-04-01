import 'package:detailsmovie/app/data/serializers/movie_serializer.dart';

abstract class MovieGateway {
  Future<MovieSerializer> getDetailsMovie();
}

class MovieGatewayImpl implements MovieGateway {
  @override
  Future<MovieSerializer> getDetailsMovie() {

    try {
      // final response = await 
    } catch (e) {
    }

    throw UnimplementedError();

  }
}
