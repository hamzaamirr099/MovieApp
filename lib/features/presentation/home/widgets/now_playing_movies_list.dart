import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_cubit.dart';
import 'package:orange_interview/features/presentation/home/widgets/playing_now_movie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NowPlayingMoviesList extends StatefulWidget {
  const NowPlayingMoviesList({Key? key}) : super(key: key);

  @override
  State<NowPlayingMoviesList> createState() => _NowPlayingMoviesListState();
}

class _NowPlayingMoviesListState extends State<NowPlayingMoviesList> {
  Timer? timer;
  int currentPage = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1 / 2);
  }

  @override
  Widget build(BuildContext context) {
    MainCubit mainCubit = MainCubit.get(context);
    return ConditionalBuilder(
      condition: mainCubit.allMovies.isNotEmpty,
      builder: (context) => Column(
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              controller: pageController,
              itemCount: mainCubit.allMovies.length,
              itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: PlayingNowMovie(movie: mainCubit.allMovies[index])),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SmoothPageIndicator(
            effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.red,
                dotColor: Colors.grey),
            controller: pageController,
            count: mainCubit.allMovies.length,
          ),
        ],
      ),
      fallback: (context) => const Center(
        child: Text("There are no movies now"),
      ),
    );
  }
}
