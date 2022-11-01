import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_cubit.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_states.dart';
import 'package:orange_interview/features/presentation/home/widgets/drawer.dart';
import '../../../../core/shared/colors_manager.dart';

class MainLayoutScreen extends StatelessWidget {
  MainLayoutScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    MainCubit mainCubit = MainCubit.get(context);
    mainCubit.getMovies();
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: drawerKey,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  drawerKey.currentState!.openDrawer();
                },
                child: SvgPicture.asset('assets/icons/menu_icon.svg'),
              ),
            ),
            title: Image.asset('assets/images/app_logo.png', height: 80),
            centerTitle: true,
          ),
          drawer: MyDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.movie_creation_outlined), label: "Tickets"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
            ],
            backgroundColor: ColorManager.primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              debugPrint(index.toString());
              mainCubit.changeScreenIndex(index);
            },
            currentIndex: mainCubit.currentScreenIndex,
          ),
          body: mainCubit.screens[mainCubit.currentScreenIndex],
        );
      },
    );
  }
}
