import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_flutter_api/model/model/movie.dart';
import 'package:technical_flutter_api/model/repository/movie_repository.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieRepository movieRepository;
  MovieListBloc({
    required this.movieRepository,
  }) : super(MovieListLoadingState()) {
    on<MovieListEvent>((event, emit) async {
      if (event is MovieListLoadEvent) {
        emit(MovieListLoadingState());
        try {
          final List<Movie> movies = await movieRepository.getMovies(
            page: event.page,
          );
          emit(MovieListLoadedState(movies: movies));
        } catch (e) {
          emit(MovieListErrorState());
        }
      }
    });
  }
}
