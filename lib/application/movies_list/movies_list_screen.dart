import 'package:flutter/material.dart';
import 'package:fluvies/application/movies_list/movies_bloc.dart' as MoviesBloc;
import 'package:fluvies/application/movies_list/movies_list_main_widget.dart';

class MoviesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Popular",
              ),
              Tab(
                text: "Top Rated",
              ),
              Tab(
                text: "Now Playing",
              ),
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Movies",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: [
            MoviesListMainWidget(MoviesBloc.MoviesCubitMode.popular),
            MoviesListMainWidget(MoviesBloc.MoviesCubitMode.topRated),
            MoviesListMainWidget(MoviesBloc.MoviesCubitMode.nowPlaying),
          ],
        ),
      ),
    );
  }
}
