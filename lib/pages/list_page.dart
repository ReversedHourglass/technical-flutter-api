import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_flutter_api/core/movie_list/movie_list_bloc.dart';
import 'package:technical_flutter_api/widgets/movie_entry.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int page = 1;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieListBloc>(context).add(const MovieListLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            BlocBuilder<MovieListBloc, MovieListState>(
              builder: (context, state) {
                if (state is MovieListLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is MovieListLoadedState) {
                  return ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push('/movie/${movie.id}');
                        },
                        child: MovieEntry(
                          title: movie.title,
                          posterPath: movie.posterPath,
                          averageVote: movie.averageVote,
                        ),
                      );
                    },
                  );
                }
                if (state is MovieListErrorState) {
                  return const Center(
                    child: Text('Error'),
                  );
                }

                return const Center(
                  child: Text('Error'),
                );
              },
            ),
            Positioned(
              bottom: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          page--;
                        });
                        BlocProvider.of<MovieListBloc>(context).add(
                          MovieListLoadEvent(
                            page: page,
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Text(page.toString()),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          page++;
                        });
                        BlocProvider.of<MovieListBloc>(context).add(
                          MovieListLoadEvent(
                            page: page,
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
