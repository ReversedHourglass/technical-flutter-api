class MovieEntity {
  final String id;
  final String title;
  final String posterPath;
  final double averageVote;
  final String? overview;
  final String? tagline;
  final int? budget;

  MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.averageVote,
    this.overview,
    this.tagline,
    this.budget,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    String? overview;
    String? tagline;
    int? budget;

    try {
      overview = json['overview'];
    } catch (e) {}

    try {
      tagline = json['tagline'];
    } catch (e) {}

    try {
      budget = json['budget'];
    } catch (e) {}

    return MovieEntity(
      id: json['id'].toString(),
      title: json['title'],
      posterPath: json['poster_path'],
      averageVote: json['vote_average'].toDouble(),
      overview: overview,
      tagline: tagline,
      budget: budget,
    );
  }

  @override
  String toString() {
    return 'MovieEntity(id: $id, title: $title, posterPath: $posterPath, averageVote: $averageVote, overview: $overview, tagline: $tagline, budget: $budget)';
  }
}
