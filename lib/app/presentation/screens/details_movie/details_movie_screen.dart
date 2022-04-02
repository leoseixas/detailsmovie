import 'package:detailsmovie/app/core/constants/app_text.dart';
import 'package:detailsmovie/app/presentation/screens/details_movie/details_movie_controller.dart';
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
      await controller.getDetailsMovie();
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
              : Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 480,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/${value.movie.image}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: Colors.green,
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.8],
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      value.movie.title,
                                      style: AppText.title,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        value.favoriteMove(value.isFavotite);
                                      },
                                      child: value.isFavotite
                                          ? Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                            ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '${value.movie.like.toString()} Likes',
                                      style: AppText.likes,
                                    ),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.circle_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '${value.movie.popularity} Views',
                                      style: AppText.likes,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
