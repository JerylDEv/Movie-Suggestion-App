import 'package:flutter/material.dart';
import './models/movie_model.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // List of Movies
  List<MovieModel> movies = [];

  // Fetch the Movie
  void fetchMovieDetails() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latest Movies'),
          backgroundColor: Colors.blueAccent[700],
        ),
        backgroundColor: Colors.blue[100],
        body: Text('This is a test'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
