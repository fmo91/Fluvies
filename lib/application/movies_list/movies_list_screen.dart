import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluvies/application/movie_detail/movie_detail_screen.dart';
import 'package:fluvies/application/movies_list/movies_bloc.dart' as MoviesBloc;
import 'package:fluvies/application/movies_list/movies_list.dart';

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

class MoviesListMainWidget extends StatelessWidget {
  final MoviesBloc.MoviesCubit _cubit;

  MoviesListMainWidget(MoviesBloc.MoviesCubitMode mode)
      : this._cubit = MoviesBloc.MoviesCubit(mode: mode) {
    _cubit.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: MoviesListMainView(),
    );
  }
}

class MoviesListMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc.MoviesCubit, MoviesBloc.Result>(
        builder: (context, MoviesBloc.Result state) {
      switch (state.runtimeType) {
        case MoviesBloc.Loading:
        case MoviesBloc.Idle:
          return Center(child: Text("Loading..."));
        case MoviesBloc.Failure:
          return Center(child: Text("Failed!"));
        case MoviesBloc.Success:
          var successResult = state as MoviesBloc.Success;
          return MoviesList(
              movies: successResult.movies,
              onSelectMovie: (movie) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie)));
              });
      }
      return Container(color: Colors.white);
    });
  }
}
