import 'package:technical_flutter_api/data/entity/movie.dart';

class Movie {
  final String id;
  final String title;
  final String overview;
  final String posterPath;
  final double averageVote;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.averageVote,
  });

  factory Movie.fromEntity(MovieEntity entity) {
    return Movie(
      id: entity.id,
      title: entity.title,
      overview: entity.overview,
      posterPath: entity.posterPath,
      averageVote: entity.averageVote,
    );
  }
}
