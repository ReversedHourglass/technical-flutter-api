import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:technical_flutter_api/core/dashboard/dashboard_bloc.dart';
import 'package:technical_flutter_api/core/movie_details/movie_details_bloc.dart';
import 'package:technical_flutter_api/core/movie_list/movie_list_bloc.dart';
import 'package:technical_flutter_api/data/repository/movie_repository_impl.dart';
import 'package:technical_flutter_api/data/repository/tv_show_repository_impl.dart';
import 'package:technical_flutter_api/model/repository/movie_repository.dart';
import 'package:technical_flutter_api/model/repository/tv_show_repository.dart';
import 'package:technical_flutter_api/router/app_router.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  final String? apiKey = dotenv.env['API_KEY'];

  if (apiKey == null || apiKey.isEmpty) {
    throw 'YOU MUST DEFINE YOUR .env FILE TO RUN THIS APPLICATION.';
  }

  runApp(
    MyApp(
      movieRepository: MovieRepositoryImpl(
        apiKey: apiKey,
      ),
      tvShowRepository: TvShowRepositoryImpl(
        apiKey: apiKey,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;
  final TvShowRepository tvShowRepository;

  const MyApp({
    required this.movieRepository,
    required this.tvShowRepository,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (BuildContext context) => DashboardBloc(
            movieRepository: movieRepository,
            tvShowRepository: tvShowRepository,
          ),
          lazy: true,
        ),
        BlocProvider<MovieListBloc>(
          create: (BuildContext context) => MovieListBloc(
            movieRepository: movieRepository,
          ),
          lazy: true,
        ),
        BlocProvider<MovieDetailsBloc>(
          create: (BuildContext context) => MovieDetailsBloc(
            movieRepository: movieRepository,
          ),
          lazy: true,
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Movie API',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}
