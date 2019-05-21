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
  // List of Movies
  List<MovieModel> movies = [];

  // Fetch the Movie
  void fetchMovieDetails() async {
    // Send Request for Top Rated
    // https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
    final response = await get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=dc2384bfb7f2daa90567c2d98e55f3ea");
    final movieModel = MovieModel.fromJson(json.decode(response.body));

    setState(() {
      movies.add(movieModel);
      print(movies[counter].results[counter].originalTitle);
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Latest Movies',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchMovieDetails,
          child: Icon(Icons.add),
        ),
        body: Center(child: MovieList(movies)),
      ),
    );
  }
}
