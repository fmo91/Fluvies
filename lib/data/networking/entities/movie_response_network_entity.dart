import 'package:fluvies/data/networking/entities/movie_network_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_response_network_entity.g.dart';

@JsonSerializable()
class MovieResponseNetworkEntity {
  final int page;

  @JsonKey(name: "results")
  final List<MovieNetworkEntity> movies;

  MovieResponseNetworkEntity(this.page, this.movies);

  factory MovieResponseNetworkEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseNetworkEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseNetworkEntityToJson(this);
}
