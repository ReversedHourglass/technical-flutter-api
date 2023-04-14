part of 'movie_list_bloc.dart';

abstract class MovieListState {}

class MovieListLoadingState extends MovieListState {}

class MovieListLoadedState extends MovieListState {
  final List<Movie> movies;

  MovieListLoadedState({
    required this.movies,
  });
}

class MovieListErrorState extends MovieListState {}
