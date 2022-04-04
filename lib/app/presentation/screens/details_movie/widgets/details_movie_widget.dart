import 'package:detailsmovie/app/core/constants/app_text.dart';
import 'package:detailsmovie/app/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class DetailsMovieWidget extends StatelessWidget {
  final Movie movie;
  final Function like;
  final bool isFavorite;

  const DetailsMovieWidget({Key key, this.movie, this.like, this.isFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 480,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tmdb.org/t/p/w500/${movie.image}',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      movie.title,
                      style: AppText.title,
                    ),
                    GestureDetector(
                      onTap: like,
                      child: isFavorite
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
                      '${movie.like.toString()} Likes',
                      style: AppText.likes,
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.circle_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${movie.popularity} Views',
                      style: AppText.likes,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
