import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetailedCard extends StatelessWidget {
  final String title;
  final String posterPath;
  final double averageVote;
  final String? overview;
  final String? tagline;
  final int? budget;
  final formatCurrency = NumberFormat.simpleCurrency();

  MovieDetailedCard({
    required this.title,
    required this.posterPath,
    required this.averageVote,
    this.overview,
    this.tagline,
    this.budget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              CachedNetworkImage(
                imageUrl: posterPath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(width: 20),
          Flexible(
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
                const SizedBox(height: 10),
                Text(
                  'Overview: $overview',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (tagline != null && tagline != '')
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Tagline: $tagline',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                if (budget != null && budget != 0)
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Budget: ${formatCurrency.format(budget)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
