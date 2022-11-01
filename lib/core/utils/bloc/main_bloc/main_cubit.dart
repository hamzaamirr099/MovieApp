import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_interview/core/shared/constants.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_states.dart';
import 'package:orange_interview/features/presentation/home/screens/home_screen.dart';
import 'package:orange_interview/features/presentation/search/screens/search_screen.dart';
import 'package:orange_interview/features/presentation/tickets/screens/tickets_screen.dart';
import 'package:orange_interview/models/movie_model.dart';
import 'package:orange_interview/models/movie_profile_model.dart';
import 'package:orange_interview/models/upcoming_model.dart';

import '../../network/remote/dio_helper.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitState());

  static MainCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    HomeScreen(),
    TicketsScreen(),
    SearchScreen(),
  ];
  int currentScreenIndex = 0;

  void changeScreenIndex(int index) {
    currentScreenIndex = index;
    emit(ScreenIndexChangedState());
  }

  Future<void> getMovies() async {
    emit(LoadingGetMoviesState());
    await getAllMovies();
    await getUpComingMovies();
    emit(SuccessGetMoviesState());
  }

  List<Movie> allMovies = [];

  Future<void> getAllMovies() async {
    allMovies = [];
    try {
      Response value = await DioHelper.getData(url: 'movies', accessToken: userToken);
      if(value.statusCode == 200)
        {
          debugPrint(value.data.toString());
          for (var movie in value.data) {
            allMovies.add(Movie.fromJson(movie));
          }
        }

    } on DioError catch (e) {
      if (e.response == null) {
        debugPrint(e.response!.data);
      } else {
        debugPrint(e.response!.data);
      }
      emit(FailedGetMoviesState());
    }
  }

  List<UpcomingMovie> upcomingMovies = [];

  Future<void> getUpComingMovies() async {
    upcomingMovies = [];
    try {
      Response value = await DioHelper.getData(
          url: 'movies/upcoming', accessToken: userToken);

      if(value.statusCode == 200)
        {
          debugPrint(value.data.toString());
          for (var movie in value.data) {
            upcomingMovies.add(UpcomingMovie.fromJson(movie));
          }
        }
    } on DioError catch (e) {
      if (e.response == null) {
        debugPrint(e.response!.data);
      } else {
        debugPrint(e.response!.data);
      }
    }
  }

  MovieProfile? movieProfile;
  Future<void> getMovieWithId({required int movieId}) async {
    emit(LoadingGetMovieProfileState());
    try {
      Response value = await DioHelper.getData(
          url: 'movies/$movieId', accessToken: userToken);

      if(value.statusCode == 200)
      {
        print(value.data['casts']);
        movieProfile = MovieProfile.fromJson(value.data);
        emit(SuccessGetMovieProfileState());

      }
    } on DioError catch (e) {
      if (e.response == null) {
        debugPrint(e.response!.data);
        emit(FailedGetMovieProfileState());

      } else {
        debugPrint(e.response!.data);
        emit(FailedGetMovieProfileState());

      }
    }
  }

  // void bookTicket({required int dateId}) async {
  //   try {
  //     Response value = await DioHelper.postData(url: 'auth/login', data: {
  //       "email": email,
  //       "password": password,
  //     });
  //     if (value.statusCode == 200) {
  //       userModel = User.fromJson(value.data);
  //       emit(SuccessLoginState(userModel!));
  //       clearFields();
  //       showToastMessage(message: "Welcome back, ${userModel!.user!.name}");
  //     }
  //   } on DioError catch (e) {
  //     showToastMessage(message: "${e.response!.data['error']['message']}");
  //
  //     emit(FailedLoginState());
  //   }
  // }

}
