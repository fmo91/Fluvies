import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluvies/data/repositories/movies_repository.dart';
import 'package:fluvies/model/movie.dart';

class MoviesCubit extends Cubit<Result> {
  final MoviesRepository _repository = MoviesRepository();

  MoviesCubit() : super(Idle());

  loadPopularMovies() async {
    emit(Loading());

    try {
      var movies = await _repository.getMovies();
      emit(Success(movies));
    } catch (_) {
      emit(Failure());
    }
  }
}

abstract class Result {}

class Idle extends Result {}

class Loading extends Result {}

class Success extends Result {
  final List<Movie> movies;

  Success(this.movies);
}

class Failure extends Result {}
