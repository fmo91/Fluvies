import 'package:flutter/material.dart';
import 'package:fluvies/model/movie.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  VoidCallback onSelect;

  MovieListItem({required this.movie, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: GestureDetector(
        onTap: this.onSelect,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (movie.posterPath != null)
              Expanded(
                  child: Image.network(
                movie.posterPath ?? "",
                fit: BoxFit.cover,
              )),
            Text(movie.title ?? "")
          ],
        ),
      ),
    );
  }
}
