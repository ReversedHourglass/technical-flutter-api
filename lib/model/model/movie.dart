import 'package:equatable/equatable.dart';
import 'package:technical_flutter_api/data/entity/movie.dart';

class Movie extends Equatable {
  final String id;
  final String title;
  final String posterPath;
  final double averageVote;
  final String? overview;
  final String? tagline;
  final int? budget;

  const Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.averageVote,
    this.overview,
    this.tagline,
    this.budget,
  });

  factory Movie.fromEntity(MovieEntity entity) {
    return Movie(
      id: entity.id,
      title: entity.title,
      posterPath: 'https://image.tmdb.org/t/p/original/${entity.posterPath}',
      averageVote: entity.averageVote,
      overview: entity.overview,
      tagline: entity.tagline,
      budget: entity.budget,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        averageVote,
        overview,
        tagline,
        budget,
      ];

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, posterPath: $posterPath, averageVote: $averageVote, overview: $overview, tagline: $tagline, budget: $budget)';
  }
}
