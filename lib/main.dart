import 'package:detailsmovie/app/data/gateway/movie_gateway.dart';
import 'package:detailsmovie/app/data/repositories/movie_repository_impl.dart';
import 'package:detailsmovie/app/domain/services/movie_service.dart';
import 'package:detailsmovie/app/presentation/screens/details_movie/details_movie_controller.dart';
import 'package:detailsmovie/app/presentation/screens/details_movie/details_movie_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => Dio()),
        Provider(
          create: (_) => MovieGatewayImpl(
            dio: Provider.of<Dio>(_, listen: false),
          ),
        ),
        Provider(
          create: (_) => MovieRepositoryImpl(
            movieGateway: Provider.of<MovieGatewayImpl>(_, listen: false),
          ),
        ),
        Provider(
          create: (_) => MovieServiceImpl(
            repository: Provider.of<MovieRepositoryImpl>(_, listen: false),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailsMovieController(
            service: Provider.of<MovieServiceImpl>(_, listen: false),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Details Movie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const DetailsMovieScreen(),
    );
  }
}
