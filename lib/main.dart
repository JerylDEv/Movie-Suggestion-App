import 'package:flutter/material.dart';
import './models/movie_model.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import './widgets/movie_list.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  int jsonListLength = 0;
  // List of Movies
  List<MovieModel> movies = [];
  ScrollController _scrollController = new ScrollController();

  // Fetch the Movie
  void fetchMovieDetails() async {
    // Send Request for Top Rated
    // https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
    final response = await get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=dc2384bfb7f2daa90567c2d98e55f3ea");
    final movieModel = MovieModel.fromJson(json.decode(response.body));
    jsonListLength = movieModel.results.length;

    if (response.statusCode == 200) {
      if (counter < jsonListLength) {
        setState(() {
          movies.add(movieModel);
          counter++;
        });
      }
    } else {
      throw Exception('Failed to load images.');
    }
  }

  void fetchTen() {
    for (var i = 0; i < 10; i++) {
      fetchMovieDetails();
    }

    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          if (counter < jsonListLength) {
            fetchTen();
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchTen();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MovieList(
            movies: movies,
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}
