import 'package:flutter/material.dart';
import 'package:fluvies/application/movie_detail/movie_detail_screen.dart';
import 'package:fluvies/application/movies_list/movies_list.dart';
import 'package:fluvies/data/repositories/movies_repository.dart';
import 'package:fluvies/model/movie.dart';

class MoviesListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoviesListState();
  }
}

class _MoviesListState extends State<MoviesListScreen> {
  List<Movie> movies = [];

  _MoviesListState() {
    this.fetchMovies();
  }

  void fetchMovies() async {
    List<Movie> movies = await MoviesRepository.getMovies();
    this.setState(() {
      this.movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MoviesList(
        movies: movies,
        onSelectMovie: (movie) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MovieDetailScreen()));
        });
  }
}
