import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/movie_model.dart';

class MovieList extends StatelessWidget {
  final List<MovieModel> movies;
  final ScrollController controller;

  MovieList({this.movies, this.controller});

  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    double cardHeight;
    Orientation.portrait == MediaQuery.of(context).orientation
        ? cardHeight = (MediaQuery.of(context).size.height * 1 / 3)
        : cardHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      controller: controller,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return movieCard(movies[index].results[index], cardHeight);
      },
    );
  }

  Widget movieCard(Result movie, double height) {
    return Container(
      child: Stack(
        children: <Widget>[
          ShaderMask(
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.transparent, Colors.black],
                ).createShader(
                    Rect.fromPoints(rect.topCenter, rect.bottomCenter));
              },
              blendMode: BlendMode.darken,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500" + movie.posterPath,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                width: double.maxFinite,
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          fontFamily: "Raleway",
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      height: height,
    );
  }
}
