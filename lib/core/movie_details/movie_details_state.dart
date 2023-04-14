part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsLoadedState extends MovieDetailsState {
  final Movie movie;

  const MovieDetailsLoadedState({
    required this.movie,
  });

  @override
  List<Object> get props => [movie];
}

class MovieDetailsErrorState extends MovieDetailsState {}
