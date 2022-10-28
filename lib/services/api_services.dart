import 'dart:convert';
import 'package:catalog_movie_app/models/movie_response.dart';
import 'package:http/http.dart' as http;

const String baseImageURL = 'https://image.tmdb.org/t/p/w500';

class ApiServices {
  static const apiKey = 'ea8fba13cee59c6d0dfdb0ff81202227';
  static const baseURL = 'https://api.themoviedb.org/3';

  Future<MovieResponse> getTopRatedMovies() async {
    final response =
        await http.get(Uri.parse('$baseURL/movie/top_rated?api_key=$apiKey'));
    final data = json.decode(response.body);

    return MovieResponse.fromJson(data);
  }

  Future<MovieResponse> getPopularMovies() async {
    final response =
        await http.get(Uri.parse('$baseURL/movie/popular?api_key=$apiKey'));
    final data = json.decode(response.body);

    return MovieResponse.fromJson(data);
  }

  Future<MovieResponse> getNowPlayingMovies() async {
    final response = await http
        .get(Uri.parse('$baseURL/movie/now_playing?api_key=$apiKey'));
    final data = json.decode(response.body);

    return MovieResponse.fromJson(data);
  }

  Future<MovieResponse> getRecommendationMovies(int id) async {
    final response = await http
        .get(Uri.parse('$baseURL/movie/$id/recommendations?api_key=$apiKey'));
    final data = json.decode(response.body);

    return MovieResponse.fromJson(data);
  }

  Future<MovieResponse> searchMovies(String query) async {
    final response = await http
        .get(Uri.parse('$baseURL/search/movie?api_key=$apiKey&query=$query'));
    final data = json.decode(response.body);

    return MovieResponse.fromJson(data);
  }
}
