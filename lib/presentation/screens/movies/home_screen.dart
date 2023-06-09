import 'package:biopedia/config/constants/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        // child: Text(dotenv.env['THE_MOVIEDB_KEY'] ?? 'No apiKey available'),
        child: Text(Enviroment.movieDbKey) ,
      )
    );
  }
}
