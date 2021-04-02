// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_network_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieNetworkEntity _$MovieNetworkEntityFromJson(Map<String, dynamic> json) {
  return MovieNetworkEntity(
    json['backdrop_path'] as String?,
    json['id'] as int,
    json['original_language'] as String,
    json['original_title'] as String,
    json['overview'] as String,
    (json['popularity'] as num).toDouble(),
    json['poster_path'] as String,
    json['release_date'] as String,
    json['title'] as String,
    json['video'] as bool,
    (json['vote_average'] as num).toDouble(),
    json['vote_count'] as int,
  );
}

Map<String, dynamic> _$MovieNetworkEntityToJson(MovieNetworkEntity instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.hasVideo,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
