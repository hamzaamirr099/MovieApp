import 'package:flutter/material.dart';
import 'package:orange_interview/models/upcoming_model.dart';

class ComingSoonMovie extends StatelessWidget {
  final UpcomingMovie upcomingMovie;

  const ComingSoonMovie(
      {Key? key, required this.upcomingMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  "${upcomingMovie.imageUrl}",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text("${upcomingMovie.name}"),
            ),
          ),
        ],
      ),
    );
  }
}
