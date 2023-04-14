import 'package:technical_flutter_api/model/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({
    int? page,
  });
}
