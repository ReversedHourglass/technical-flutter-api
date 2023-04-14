import 'package:flutter/material.dart';

class MovieEntry extends StatelessWidget {
  final String title;
  final String posterPath;
  final double averageVote;

  const MovieEntry({
    required this.title,
    required this.posterPath,
    required this.averageVote,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
