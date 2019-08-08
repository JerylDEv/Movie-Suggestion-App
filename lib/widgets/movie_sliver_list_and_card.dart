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
        (context, index) => movieCard(
            movies[index].results[index], movies[index].results[index].rating),
        childCount: movies.length,
      ),
    );
  }

  Widget movieCard(Result movie, double rating, [double height]) {
    return Container(
      // constraints: BoxConstraints(maxWidth: 10, maxHeight: 500),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(8, 28, 36, 1),
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage.assetNetwork(
              placeholder: 'images/poweredby-tmdb-green.png',
              fadeInDuration: const Duration(seconds: 1),
              fadeOutDuration: const Duration(seconds: 1),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitHeight,
              width: double.maxFinite,
              image: "https://image.tmdb.org/t/p/w500" + movie.posterPath,
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: Column(
              children: <Widget>[
                // Container(
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(50),
                //     ),
                //     // color: Color.fromRGBO(8, 28, 36, 1),
                //     color: Colors.black87,
                //   ),
                //   child: Text(
                //     movie.title,
                //     style: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 20.0,
                //       fontFamily: "Raleway",
                //       color: Colors.white,
                //     ),
                //     overflow: TextOverflow.ellipsis,
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 5.0),
                // ),
                Container(
                  child: VoteRating(value: rating),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    // color: Color.fromRGBO(8, 28, 36, 1),
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      height: height,
    );
  }
}
