import 'package:flutter/cupertino.dart';
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
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                  "https://image.tmdb.org/t/p/w500" + movie.posterPath),
            ),
          ),
          Text(
            movie.originalTitle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
              fontFamily: "Raleway",
            ),
          )
        ],
      ),
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: Colors.blueGrey,
          ),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
