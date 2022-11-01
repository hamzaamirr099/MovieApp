import 'package:flutter/material.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_cubit.dart';
import 'package:orange_interview/features/presentation/movie_profile/screens/movie_profile_screen.dart';
import 'package:orange_interview/models/movie_model.dart';

class PlayingNowMovie extends StatelessWidget {
  final Movie movie;

  const PlayingNowMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MainCubit.get(context).getMovieWithId(movieId: movie.id!);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MovieProfileScreen(),
          ),
        );
      },
      child: ClipRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.network("${movie.imageUrl}"),
        ),
      ),
    );
  }
}
