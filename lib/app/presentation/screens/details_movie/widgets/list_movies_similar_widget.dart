import 'package:detailsmovie/app/core/constants/app_text.dart';
import 'package:detailsmovie/app/domain/entities/similar_movies.dart';
import 'package:flutter/material.dart';

class ListMoviesSimilarWidget extends StatelessWidget {
  final SimilarMovies similarMovies;

  const ListMoviesSimilarWidget({Key key, this.similarMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              'https://image.tmdb.org/t/p/w500/${similarMovies.image}'),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  similarMovies.title,
                  style: AppText.titleMovieSimilar,
                ),
                Text(
                  '${similarMovies.data.year}',
                  style: AppText.dateMovieSimilar,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
