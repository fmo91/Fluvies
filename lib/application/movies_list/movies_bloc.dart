import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluvies/data/repositories/movies_repository.dart';
import 'package:fluvies/model/movie.dart';

class MoviesCubit extends Cubit<Result> {
  final MoviesRepository _repository = MoviesRepository();
  final MoviesCubitMode mode;

  MoviesCubit({required this.mode}) : super(Idle());

  loadMovies() async {
    emit(Loading());

    try {
      switch (this.mode) {
        case MoviesCubitMode.nowPlaying:
          final movies = await _repository.getNowPlayingMovies();
          emit(Success(movies));
          break;
        case MoviesCubitMode.popular:
          final movies = await _repository.getPopularMovies();
          emit(Success(movies));
          break;
        case MoviesCubitMode.topRated:
          final movies = await _repository.getTopRatedMovies();
          emit(Success(movies));
          break;
      }
    } catch (ex) {
      emit(Failure());
    }
  }
}

enum MoviesCubitMode { nowPlaying, popular, topRated }

abstract class Result {}

class Idle extends Result {}

class Loading extends Result {}

class Success extends Result {
  final List<Movie> movies;

  Success(this.movies);
}

class Failure extends Result {}
