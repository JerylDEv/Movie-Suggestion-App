import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../models/movie_model.dart';
import './vote_rating.dart';

class MovieSliverList extends StatelessWidget {
  final List<MovieModel> movies;
  MovieSliverList({this.movies});

  @override
  Widget build(BuildContext context) {
    double cardHeight;
    Orientation.portrait == MediaQuery.of(context).orientation
        ? cardHeight = (MediaQuery.of(context).size.height * 1 / 3)
        : cardHeight = MediaQuery.of(context).size.height;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => movieCard(movies[index].results[index], cardHeight,
            movies[index].results[index].rating),
        childCount: movies.length,
      ),
    );
  }

  Widget movieCard(Result movie, double height, double rating) {
    return Container(
      child: Stack(
        children: <Widget>[
          ShaderMask(
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.transparent, Colors.black],
                ).createShader(
                  Rect.fromPoints(rect.topCenter, rect.bottomCenter),
                );
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
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                ),
                VoteRating(value: rating),
              ],
            ),
          )
        ],
      ),
      height: height,
    );
  }
}
