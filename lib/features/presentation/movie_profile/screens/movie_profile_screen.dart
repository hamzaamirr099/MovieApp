import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_cubit.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_states.dart';
import 'package:orange_interview/features/presentation/movie_profile/widgets/actor_item.dart';
import 'package:orange_interview/features/presentation/movie_profile/widgets/date_button.dart';

class MovieProfileScreen extends StatelessWidget {
  const MovieProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainCubit mainCubit = MainCubit.get(context);
    return Scaffold(
      // appBar: AppBar(),
      body: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! LoadingGetMovieProfileState,
            builder: (context) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        '${mainCubit.movieProfile!.imageUrl}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 400,
                      ),
                      SafeArea(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          "${mainCubit.movieProfile!.name}",
                          style: const TextStyle(fontSize: 25),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "PG-13",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child:
                                  SvgPicture.asset("assets/icons/ellipse.svg"),
                            ),
                            Text(
                              "${mainCubit.movieProfile!.duration}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child:
                                  SvgPicture.asset("assets/icons/ellipse.svg"),
                            ),
                            Text(
                              "${mainCubit.movieProfile!.genres}",
                              style: Theme.of(context).textTheme.titleSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/star.svg"),
                            SvgPicture.asset("assets/images/star.svg"),
                            SvgPicture.asset("assets/images/star.svg"),
                            SvgPicture.asset("assets/images/star.svg"),
                            SvgPicture.asset("assets/images/star.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("${mainCubit.movieProfile!.rating}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Synopsis",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "${mainCubit.movieProfile!.overView}",
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Cast & crew",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Text(
                              'See All',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const Icon(
                              Icons.double_arrow_rounded,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 250,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ActorItem(
                                actorImage:
                                    "${mainCubit.movieProfile!.casts[index].imageUrl}",
                                actorName:
                                    "${mainCubit.movieProfile!.casts[index].actorName}",
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 20,
                              ),
                              itemCount: mainCubit.movieProfile!.casts.length,
                            ),
                          ),
                        ),
                        Text('Select Date',
                            style: Theme.of(context).textTheme.titleLarge),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 80,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => DateButton(
                                movieDate:
                                    mainCubit.movieProfile!.movieDates[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 20,
                              ),
                              itemCount:
                                  mainCubit.movieProfile!.movieDates.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
