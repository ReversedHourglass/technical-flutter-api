import 'package:equatable/equatable.dart';
import 'package:technical_flutter_api/data/entity/tv_show.dart';

class TvShow extends Equatable {
  final String id;
  final String title;
  final String posterPath;

  const TvShow({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory TvShow.fromEntity(TvShowEntity entity) {
    return TvShow(
      id: entity.id,
      title: entity.title,
      posterPath: 'https://image.tmdb.org/t/p/original/${entity.posterPath}',
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
      ];

  @override
  String toString() {
    return 'TvShow(id: $id, title: $title, posterPath: $posterPath)';
  }
}
