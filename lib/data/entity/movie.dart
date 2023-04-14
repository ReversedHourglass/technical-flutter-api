class MovieEntity {
  final String id;
  final String title;
  final String overview;
  final String posterPath;
  final double averageVote;

  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.averageVote,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json['id'].toString(),
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      averageVote: json['vote_average'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'MovieEntity(id: $id, title: $title, overview: $overview, posterPath: $posterPath, averageVote: $averageVote)';
  }
}
