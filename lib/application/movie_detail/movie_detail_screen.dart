import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluvies/model/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie _movie;

  MovieDetailScreen(Movie movie) : this._movie = movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Movie Detail",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              if (_movie.posterPath != null) Image.network(_movie.posterPath!),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _movie.title ?? "",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _movie.overview ?? "",
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
