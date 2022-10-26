import 'package:equatable/equatable.dart';
import 'movie.dart';

class MovieResponse extends Equatable {
  final List<Movie> movieList;

  const MovieResponse({required this.movieList});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        movieList: List<Movie>.from((json["results"] as List)
            .map((x) => Movie.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(movieList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [movieList];
}
