import 'package:equatable/equatable.dart';
import 'package:technical_flutter_api/data/entity/movie.dart';

class Movie extends Equatable {
  final String id;
  final String title;
  final String overview;
  final String posterPath;
  final double averageVote;

  const Movie({
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
      posterPath: 'https://image.tmdb.org/t/p/original/${entity.posterPath}',
      averageVote: entity.averageVote,
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        overview,
        posterPath,
        averageVote,
      ];

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, posterPath: $posterPath, averageVote: $averageVote)';
  }
}
