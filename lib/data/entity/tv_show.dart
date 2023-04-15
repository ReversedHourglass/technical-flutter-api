class TvShowEntity {
  final String id;
  final String title;
  final String posterPath;

  TvShowEntity({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory TvShowEntity.fromJson(Map<String, dynamic> json) {
    return TvShowEntity(
      id: json['id'].toString(),
      title: json['name'],
      posterPath: json['poster_path'],
    );
  }

  @override
  String toString() {
    return 'TvShowEntity(id: $id, name: $title, posterPath: $posterPath)';
  }
}
