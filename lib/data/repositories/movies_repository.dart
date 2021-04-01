import 'package:fluvies/data/networking/movies_client.dart';
import 'package:fluvies/data/repositories/mappers/movie_networking_mapper.dart';
import 'package:fluvies/model/movie.dart';

class MoviesRepository {
  static Future<List<Movie>> getMovies() async {
    var popularMovies = await MoviesNetworkingClient().getPopularMovies();
    var mapper = MovieNetworkingMapper();
    return popularMovies.map(mapper.modelFromNetworkingEntity).toList();
  }
}
