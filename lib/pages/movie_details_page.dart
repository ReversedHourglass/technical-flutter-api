import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_flutter_api/core/movie_details/movie_details_bloc.dart';

class MovieDetailsPage extends StatefulWidget {
  final String? id;
  const MovieDetailsPage({
    this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      BlocProvider.of<MovieDetailsBloc>(context)
          .add(MovieDetailsLoadFromIdEvent(id: widget.id!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MovieDetailsLoadedState) {
            return Center(
              child: Text(state.movie.title),
            );
          }
          if (state is MovieDetailsErrorState) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
