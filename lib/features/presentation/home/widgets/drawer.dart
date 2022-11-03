import 'package:flutter/material.dart';
import 'package:orange_interview/core/utils/bloc/authorization_bloc/auth_cubit.dart';
import 'package:orange_interview/core/utils/bloc/main_bloc/main_cubit.dart';
import 'package:orange_interview/features/presentation/home/widgets/drawer_item.dart';

import '../../../../core/shared/functions.dart';
import '../../../../core/utils/network/local/chache_helper.dart';
import '../../authentication/screens/login_screen.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    return SafeArea(
      child: Container(
        color: Colors.grey[900],
        width: MediaQuery.of(context).size.width / 1.5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      authCubit.userModel != null? '${authCubit.userModel!.user!.name}' : "Hamza Mahmoud",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    children: [
                      DrawerItem(
                        imagePath: 'assets/icons/account_icon.svg',
                        text: 'Account',
                        onTapFunction: (){},
                      ),
                      const SizedBox(height: 30,),
                      DrawerItem(
                        imagePath: 'assets/icons/settings_icon.svg',
                        text: 'Settings',
                        onTapFunction: (){},
                      ),
                      const SizedBox(height: 30,),
                      DrawerItem(
                        imagePath: 'assets/icons/info_icon.svg',
                        text: 'About',
                        onTapFunction: (){},
                      ),
                      const SizedBox(height: 30,),
                      DrawerItem(
                        imagePath: 'assets/icons/logout_icon.svg',
                        text: 'Logout',
                        onTapFunction: (){
                          CacheHelper.removeKey(key: 'userToken');
                          navigateAndRelease(
                            context,
                            LoginScreen(),
                          );
                        },
                      ),
                    ],
                  )
                  // ListView.separated(
                  //   itemBuilder: (context, index) => DrawerItem(
                  //       imagePath: iconsPath[index], text: iconsTitle[index]),
                  //   separatorBuilder: (context, index) => const SizedBox(
                  //     height: 30,
                  //   ),
                  //   itemCount: iconsTitle.length,
                  // ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
