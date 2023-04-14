part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailsLoadFromIdEvent extends MovieDetailsEvent {
  final String id;

  const MovieDetailsLoadFromIdEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
