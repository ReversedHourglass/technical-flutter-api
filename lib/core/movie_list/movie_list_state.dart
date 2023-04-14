part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListLoadingState extends MovieListState {}

class MovieListLoadedState extends MovieListState {
  final List<Movie> movies;

  const MovieListLoadedState({
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class MovieListErrorState extends MovieListState {}
