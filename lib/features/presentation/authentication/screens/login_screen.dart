import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_interview/core/shared/constants.dart';
import 'package:orange_interview/core/utils/bloc/authorization_bloc/auth_cubit.dart';
import 'package:orange_interview/core/widgets/default_button.dart';
import 'package:orange_interview/features/presentation/authentication/screens/register_screen.dart';
import 'package:orange_interview/features/presentation/main_layout/screens/main_layout_screen.dart';

import '../../../../core/shared/functions.dart';
import '../../../../core/utils/bloc/authorization_bloc/auth_states.dart';
import '../../../../core/utils/network/local/chache_helper.dart';
import '../../../../core/widgets/default_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset('assets/images/app_logo.png'),
                const SizedBox(
                  height: 20,
                ),
                const Text("Login", style: TextStyle(fontSize: 50, fontFamily: 'salsa')),
                const SizedBox(
                  height: 30,
                ),
                DefaultFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  hintText: "Email",
                  controller: authCubit.emailController,
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  hintText: "Password",
                  controller: authCubit.passwordController,
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,

                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) async {
                    if (state is SuccessLoginState) {
                      userToken = state.userModel.accessToken!;
                      await CacheHelper.saveData(
                          key: 'userToken', value: userToken);
                      navigateAndRelease(context, MainLayoutScreen());
                    }
                  },
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! LoadingLoginState,
                      builder: (context) => DefaultButton(
                        buttonText: "Login",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            debugPrint("pressed");
                            authCubit.login(
                              email: authCubit.emailController.text,
                              password: authCubit.passwordController.text,
                            );
                          }
                        },
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text("Signup"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      "  or connect with  ",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey[800]),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/twitter_icon.svg'),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset('assets/icons/face_icon.svg'),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset('assets/icons/google_icon.svg'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
