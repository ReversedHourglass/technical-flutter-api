part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object?> get props => [];
}

class MovieListLoadEvent extends MovieListEvent {
  final int? page;

  const MovieListLoadEvent({
    this.page,
  });

  @override
  List<Object?> get props => [page];
}
