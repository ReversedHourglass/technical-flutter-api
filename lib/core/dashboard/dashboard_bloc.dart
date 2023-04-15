import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_flutter_api/model/model/movie.dart';
import 'package:technical_flutter_api/model/model/tv_show.dart';
import 'package:technical_flutter_api/model/repository/movie_repository.dart';
import 'package:technical_flutter_api/model/repository/tv_show_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final TvShowRepository tvShowRepository;
  final MovieRepository movieRepository;
  DashboardBloc({
    required this.tvShowRepository,
    required this.movieRepository,
  }) : super(DashboardLoadingState()) {
    on<DashboardEvent>((event, emit) async {
      if (event is DashboardLoadEvent) {
        emit(DashboardLoadingState());
        try {
          final List<TvShow> tvShows = await tvShowRepository.getTopRated();
          final List<Movie> movies = await movieRepository.getTopRated();
          emit(
            DashboardLoadedState(
              tvShows: tvShows,
              movies: movies,
            ),
          );
        } catch (e) {
          emit(DashboardErrorState());
        }
      }
    });
  }
}
