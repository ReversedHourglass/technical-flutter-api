import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_flutter_api/core/dashboard/dashboard_bloc.dart';
import 'package:technical_flutter_api/widgets/horizontal_media_entry.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(DashboardLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DashboardLoadedState) {
              return Column(
                children: [
                  Row(
                    children: const [
                      SizedBox(width: 16),
                      Text(
                        'Top Rated Movies',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return HorizontalPosterEntry(
                          key: ValueKey(movie.id),
                          title: movie.title,
                          posterPath: movie.posterPath,
                        );
                      },
                    ),
                  ),
                  Row(
                    children: const [
                      SizedBox(width: 16),
                      Text(
                        'Top Rated TV Shows',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.tvShows.length,
                      itemBuilder: (context, index) {
                        final tvShow = state.tvShows[index];
                        return HorizontalPosterEntry(
                          key: ValueKey(tvShow.id),
                          title: tvShow.title,
                          posterPath: tvShow.posterPath,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            if (state is DashboardErrorState) {
              return const Center(
                child: Text('Error'),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
