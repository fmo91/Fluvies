import 'dart:convert';

import 'package:fluvies/data/networking/entities/movie_network_entity.dart';
import 'package:fluvies/data/networking/entities/movie_response_network_entity.dart';
import 'package:http/http.dart' as http;

class MoviesNetworkingClient {
  Uri url({required String endpoint}) => Uri(
      scheme: "https",
      host: "api.themoviedb.org",
      path: "3/$endpoint",
      queryParameters: {"api_key": "681a8e4bf0c4e63af1b7c13369c0effa"});

  Future<List<MovieNetworkEntity>> getPopularMovies() =>
      getMovies("movie/popular");
  Future<List<MovieNetworkEntity>> getTopRatedMovies() =>
      getMovies("movie/top_rated");
  Future<List<MovieNetworkEntity>> getNowPlayingMovies() =>
      getMovies("movie/now_playing");

  Future<List<MovieNetworkEntity>> getMovies(String endpoint) async {
    var url = this.url(endpoint: endpoint);
    var result = await http.get(url);
    Map<String, dynamic> resultMap = jsonDecode(result.body);
    var resultObject = MovieResponseNetworkEntity.fromJson(resultMap);
    return Future.value(resultObject.movies);
  }
}
