import 'package:technical_flutter_api/model/model/tv_show.dart';

abstract class TvShowRepository {
  Future<List<TvShow>> getTopRated({
    int? page,
  });
}
