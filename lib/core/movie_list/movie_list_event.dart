part of 'movie_list_bloc.dart';

abstract class MovieListEvent {}

class MovieListLoadEvent extends MovieListEvent {
  final int? page;

  MovieListLoadEvent({
    this.page,
  });
}
