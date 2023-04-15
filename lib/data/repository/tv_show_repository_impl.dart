import 'dart:convert';
import 'package:technical_flutter_api/data/entity/tv_show.dart';
import 'package:http/http.dart' as http;
import 'package:technical_flutter_api/model/model/tv_show.dart';
import 'package:technical_flutter_api/model/repository/tv_show_repository.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  final String apiKey;

  TvShowRepositoryImpl({
    required this.apiKey,
  });

  @override
  Future<List<TvShow>> getTopRated({
    int? page,
  }) async {
    var url = Uri.https(
      'api.themoviedb.org',
      '3/tv/top_rated',
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
    List<TvShow> tvShows = [];

    for (final element in results) {
      try {
        TvShowEntity entity = TvShowEntity.fromJson(element);
        tvShows.add(TvShow.fromEntity(entity));
      } catch (e) {
        // TV shows from the "TheMovieDb" APi have optional fields.
        // If one of the field is not present, just ignore the TV show.
        continue;
      }
    }

    return tvShows;
  }
}
