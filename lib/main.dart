import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_list/widgets/movie_sliver_appbar.dart';
import './models/movie_model.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import './widgets/movie_sliver_list.dart';

void main() async {
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
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
        body: _buildScrollable(context),
      ),
    );
  }

  Widget _buildScrollable(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MovieSliverAppBar(),
        MovieSliverList(movies: movies),
      ],
    );
  }
}
