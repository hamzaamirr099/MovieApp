import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_interview/core/shared/constants.dart';
import 'package:orange_interview/core/utils/bloc/authorization_bloc/auth_cubit.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_cubit.dart';
import 'package:orange_interview/features/presentation/splash/splash_screen.dart';
import 'core/shared/bloc_opserver.dart';
import 'core/shared/colors_manager.dart';
import 'core/utils/network/local/chache_helper.dart';
import 'core/utils/network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  //shared preferences
  userToken = CacheHelper.getData(key: 'userToken') ?? '';

  debugPrint("Current userToken is --------------------------> $userToken");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(
          create: (context) => MainCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Orange interview',
        theme: ThemeData(
          // fontFamily: 'salsa',
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: ColorManager.primaryColor,
          appBarTheme: const AppBarTheme(color: ColorManager.primaryColor, toolbarHeight: 100, elevation: 0),
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            titleSmall: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
