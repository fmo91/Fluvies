import 'package:flutter/material.dart';
import 'package:fluvies/application/movies_list/movie_list_item.dart';
import 'package:fluvies/model/movie.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  final void Function(Movie) onSelectMovie;

  MoviesList({required this.movies, required this.onSelectMovie});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: 10),
      crossAxisCount: 2,
      children: List.generate(this.movies.length, (index) {
        Movie movie = this.movies[index];
        return MovieListItem(
          movie: movie,
          onSelect: () {
            onSelectMovie(movie);
          },
        );
      }),
    );
  }
}
