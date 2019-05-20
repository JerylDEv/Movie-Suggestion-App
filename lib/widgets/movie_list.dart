import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieList extends StatelessWidget {
  final List<MovieModel> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return movieCard(movies[index].results[index]);
      },
    );
  }

  Widget movieCard(Result movie) {
    return Container(
      child: Text(movie.originalTitle),
    );
  }
}
