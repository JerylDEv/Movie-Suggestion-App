import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_list/screens/splash_screen.dart';

void main() async {
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //primarySwatch: Colors.purple,
          // primaryColor: Color.fromRGBO(1, 210, 119, 1),
          primarySwatch: Colors.green
          // primarySwatch: Colors.greenAccent[400],
          ),
      home: Scaffold(
        body: SafeArea(
          child: SplashScreen(),
        ),
      ),
    );
  }
}
