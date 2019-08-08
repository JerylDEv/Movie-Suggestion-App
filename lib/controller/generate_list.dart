import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:movie_list/widgets/movie_sliver_list_and_card.dart';
import 'dart:convert';
import '../models/movie_model.dart';

class MovieList extends StatefulWidget {
  MovieList({Key key}) : super(key: key);

  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<MovieModel> movies = [];
  ScrollController _scrollController = new ScrollController();
  // Loading Status

  // Fetch the Movie
  void fetchMovieDetails() async {
    // Send Request for Top Rated
    // https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
    final response = await get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=dc2384bfb7f2daa90567c2d98e55f3ea");
    final movieModel = MovieModel.fromJson(json.decode(response.body));

    if (response.statusCode == 200) {
      setState(
        () {
          for (int counter = 0;
              counter < movieModel.results.length;
              counter++) {
            movies.add(movieModel);
          }
        },
      );
    } else {
      throw Exception('Failed to load images.');
    }
  }

  void initState() {
    super.initState();
    fetchMovieDetails();
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MovieSliverList(movies: movies);
  }
}
