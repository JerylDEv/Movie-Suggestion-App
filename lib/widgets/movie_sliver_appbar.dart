import 'package:flutter/material.dart';

class MovieSliverAppBar extends StatelessWidget {
  const MovieSliverAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: false,
      floating: true,
      expandedHeight: 150,
      backgroundColor: Color.fromRGBO(8, 28, 36, 1),
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          children: <Widget>[
            Text('Latest Movies'),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
            ),
            Icon(
              Icons.movie_filter,
              color: Colors.white,
            ),
          ],
        ),
        // background: Image.file(File('../images/poweredby-tmdb-green.png')),
      ),
    );
  }
}

class PoweredByTMDB extends StatelessWidget {
  const PoweredByTMDB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('images/poweredby-tmdb-green (1).png'),
      height: 200.0,
    );
  }
}
