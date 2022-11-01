import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_cubit.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_states.dart';
import 'package:orange_interview/features/presentation/home/widgets/coming_soon_movie.dart';
import 'package:orange_interview/features/presentation/home/widgets/now_playing_movies_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainCubit mainCubit = MainCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Now Playing',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white, fontFamily: 'salsa'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Book your ticket now',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.red, fontFamily: 'salsa'),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<MainCubit, MainStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ConditionalBuilder(
                    condition: state is! LoadingGetMoviesState,
                    builder: (context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const NowPlayingMoviesList(),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          'Coming soon',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: mainCubit.upcomingMovies.isNotEmpty,
                          builder: (context) => CarouselSlider.builder(
                            itemCount: mainCubit.upcomingMovies.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                                ComingSoonMovie(
                                  upcomingMovie: mainCubit.upcomingMovies[itemIndex],
                                ),
                            options: CarouselOptions(autoPlay: true),
                          ),
                          fallback: (context) => const Center(child: Text("There are no upcoming movies")),
                        ),
                      ],
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
