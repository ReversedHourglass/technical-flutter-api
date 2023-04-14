import 'package:technical_flutter_api/model/model/movie.dart';

abstract class MovieRepository {
  Future<Movie> getById({
    required String id,
  });

  Future<List<Movie>> getMovies({
    int? page,
  });
}
