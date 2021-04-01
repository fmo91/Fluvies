import 'package:fluvies/data/networking/entities/movie_network_entity.dart';
import 'package:fluvies/model/movie.dart';

class MovieNetworkingMapper {
  String _imageUrl({required String source}) {
    return "https://image.tmdb.org/t/p/w500${source}";
  }

  Movie modelFromNetworkingEntity(MovieNetworkEntity entity) {
    return Movie(
        _imageUrl(source: entity.backdropPath),
        entity.id,
        entity.originalLanguage,
        entity.originalTitle,
        entity.overview,
        entity.popularity,
        _imageUrl(source: entity.posterPath),
        entity.releaseDate,
        entity.title,
        entity.hasVideo,
        entity.voteAverage,
        entity.voteCount);
  }
}
