import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:technical_flutter_api/model/model/movie.dart';
import 'package:technical_flutter_api/model/repository/movie_repository.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieRepository movieRepository;
  MovieDetailsBloc({
    required this.movieRepository,
  }) : super(MovieDetailsLoadingState()) {
    on<MovieDetailsEvent>((event, emit) async {
      if (event is MovieDetailsLoadFromIdEvent) {
        emit(MovieDetailsLoadingState());
        try {
          final Movie movie = await movieRepository.getById(
            id: event.id,
          );
          emit(MovieDetailsLoadedState(movie: movie));
        } catch (e) {
          emit(MovieDetailsErrorState());
        }
      }
    });
  }
}
