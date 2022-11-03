import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_interview/core/utils/bloc/authorization_bloc/auth_cubit.dart';

import '../../../../core/shared/constants.dart';
import '../../../../core/shared/functions.dart';
import '../../../../core/utils/bloc/authorization_bloc/auth_states.dart';
import '../../../../core/utils/network/local/chache_helper.dart';
import '../../../../core/widgets/default_button.dart';
import '../../../../core/widgets/default_text_form_field.dart';
import '../../main_layout/screens/main_layout_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
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
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 50, fontFamily: 'salsa'),
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
                  hintText: "Full Name",
                  controller: authCubit.registerNameController,
                  prefixIcon: Icons.person_outline,
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
                  hintText: "Email",
                  controller: authCubit.registerEmailController,
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
                  isPassword: true,
                  controller: authCubit.registerPasswordController,
                  prefixIcon: Icons.lock_outline,
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {
                    if (state is SuccessSignUpState) {
                      userToken = state.userModel.accessToken!;
                      CacheHelper.saveData(key: 'userToken', value: userToken);
                      navigateAndRelease(context, MainLayoutScreen());
                    }
                  },
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! LoadingSignUpState,
                      builder: (context) => DefaultButton(
                        buttonText: "Sign Up",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            authCubit.signup(
                              name: authCubit.registerNameController.text,
                              email: authCubit.registerEmailController.text,
                              password:
                                  authCubit.registerPasswordController.text,
                            );
                          }
                        },
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
