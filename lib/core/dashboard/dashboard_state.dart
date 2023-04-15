part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardLoadingState extends DashboardState {}

class DashboardLoadedState extends DashboardState {
  final List<TvShow> tvShows;
  final List<Movie> movies;

  const DashboardLoadedState({
    required this.tvShows,
    required this.movies,
  });

  @override
  List<Object> get props => [
        tvShows,
        movies,
      ];
}

class DashboardErrorState extends DashboardState {}
