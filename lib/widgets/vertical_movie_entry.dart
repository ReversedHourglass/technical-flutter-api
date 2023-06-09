import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VerticalMovieEntry extends StatelessWidget {
  final String title;
  final String posterPath;
  final double averageVote;

  const VerticalMovieEntry({
    required this.title,
    required this.posterPath,
    required this.averageVote,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: posterPath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Average vote: $averageVote',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
