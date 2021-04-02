import 'package:fluvies/data/networking/movies_client.dart';
import 'package:fluvies/data/repositories/mappers/movie_networking_mapper.dart';
import 'package:fluvies/model/movie.dart';

class MoviesRepository {
  Future<List<Movie>> getPopularMovies() async {
    var popularMovies = await MoviesNetworkingClient().getPopularMovies();
    var mapper = MovieNetworkingMapper();
    return popularMovies.map(mapper.modelFromNetworkingEntity).toList();
  }

  Future<List<Movie>> getTopRatedMovies() async {
    var popularMovies = await MoviesNetworkingClient().getTopRatedMovies();
    var mapper = MovieNetworkingMapper();
    return popularMovies.map(mapper.modelFromNetworkingEntity).toList();
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    var popularMovies = await MoviesNetworkingClient().getNowPlayingMovies();
    var mapper = MovieNetworkingMapper();
    return popularMovies.map(mapper.modelFromNetworkingEntity).toList();
  }
}
