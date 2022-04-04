import 'package:detailsmovie/app/presentation/screens/details_movie/details_movie_controller.dart';
import 'package:detailsmovie/app/presentation/screens/details_movie/widgets/details_movie_widget.dart';
import 'package:detailsmovie/app/presentation/screens/details_movie/widgets/list_movies_similar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsMovieScreen extends StatefulWidget {
  const DetailsMovieScreen({Key key}) : super(key: key);

  @override
  State<DetailsMovieScreen> createState() => _DetailsMovieScreenState();
}

class _DetailsMovieScreenState extends State<DetailsMovieScreen> {
  DetailsMovieController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      controller = Provider.of<DetailsMovieController>(context, listen: false);
      await controller.initializerScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<DetailsMovieController>(
        builder: (context, value, child) {
          return value.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: Column(
                    children: [
                      DetailsMovieWidget(
                        movie: value.movie,
                        like: () {
                          value.favoriteMove(value.isFavorite);
                        },
                        isFavorite: value.isFavorite,
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            // physics: NeverScrollableScrollPhysics(),
                            controller: value.pageController,
                            itemCount: value.listSimilarMovies.length,
                            itemBuilder: (context, index) {
                              return ListMoviesSimilarWidget(
                                similarMovies: value.listSimilarMovies[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
