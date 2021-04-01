// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_network_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponseNetworkEntity _$MovieResponseNetworkEntityFromJson(
    Map<String, dynamic> json) {
  return MovieResponseNetworkEntity(
    json['page'] as int,
    (json['results'] as List<dynamic>)
        .map((e) => MovieNetworkEntity.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieResponseNetworkEntityToJson(
        MovieResponseNetworkEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies,
    };
