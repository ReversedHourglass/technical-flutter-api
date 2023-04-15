import 'dart:convert';

import 'package:technical_flutter_api/data/entity/movie.dart';
import 'package:technical_flutter_api/model/model/movie.dart';
import 'package:technical_flutter_api/model/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl extends MovieRepository {
  final String apiKey;

  MovieRepositoryImpl({
    required this.apiKey,
  });

  @override
  Future<Movie> getById({
    required String id,
  }) async {
    var url = Uri.https(
      'api.themoviedb.org',
      '3/movie/$id',
      {
        'api_key': apiKey,
        'language': 'en-US',
      },
    );
    var response = await http.get(
      url,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load movie');
    }

    Map<String, dynamic> json = jsonDecode(response.body);
    MovieEntity entity = MovieEntity.fromJson(json);

    return Movie.fromEntity(entity);
  }

  @override
  Future<List<Movie>> getTopRated({
    int? page,
  }) async {
    var url = Uri.https(
      'api.themoviedb.org',
      '3/movie/top_rated',
      {
        'api_key': apiKey,
        'language': 'en-US',
        'page': page != null ? page.toString() : '1',
      },
    );
    var response = await http.get(
      url,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load movies');
    }

    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> results = json['results'];
    List<Movie> movies = [];

    for (final element in results) {
      try {
        MovieEntity entity = MovieEntity.fromJson(element);
        movies.add(Movie.fromEntity(entity));
      } catch (e) {
        // Movies from the "TheMovieDb" APi have optional fields.
        // If one of the field is not present, just ignore the movie.
        continue;
      }
    }

    return movies;
  }
}
