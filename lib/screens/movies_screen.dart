import 'package:flutter/material.dart';
import 'package:movie_list/controller/generate_list.dart';
import 'package:movie_list/widgets/movie_sliver_appbar.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 28, 36, 1),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            MovieSliverAppBar(),
            MovieList(),
          ],
        ),
      ),
    );
  }
}
