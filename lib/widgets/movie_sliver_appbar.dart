import 'package:flutter/material.dart';

class MovieSliverAppBar extends StatelessWidget {
  const MovieSliverAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 130,
      backgroundColor: Color.fromRGBO(8, 28, 36, 1),
      flexibleSpace: FlexibleSpaceBar(
        background: Image(
          image: AssetImage('images/cinema.jpg'),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('TMDB Latest Movies'),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
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
