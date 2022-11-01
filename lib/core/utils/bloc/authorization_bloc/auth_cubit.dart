import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_interview/core/shared/functions.dart';
import '../../../../models/user_model.dart';
import '../../network/remote/dio_helper.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(InitAuthState());

  static AuthCubit get(context) => BlocProvider.of(context);

  //login controllers
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //register controllers
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();

  User? userModel;

  void login({required String email, required String password}) async {
    emit(LoadingLoginState());
    try {
      Response value = await DioHelper.postData(url: 'auth/login', data: {
        "email": email,
        "password": password,
      });
      if (value.statusCode == 200) {
        userModel = User.fromJson(value.data);
        emit(SuccessLoginState(userModel!));
        clearFields();
        showToastMessage(message: "Welcome back, ${userModel!.user!.name}");
      }
    } on DioError catch (e) {
      // showToastMessage(message: "${e.response!.data['error']['message']}");
      showToastMessage(message: "Invalid email or password", toastColor: Colors.red);

      emit(FailedLoginState());
    }
  }

  void signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(LoadingSignUpState());
    try {
      Response value = await DioHelper.postData(url: 'auth/register', data: {
        "email": email,
        "password": password,
        "name": name,
      });
      if (value.statusCode == 200) {
        userModel = User.fromJson(value.data);
        emit(SuccessSignUpState(userModel!));
        clearFields();
        showToastMessage(message: "Welcome, ${userModel!.user!.name}");
      }
    } on DioError catch (e) {
      showToastMessage(message: "${e.response!.data['error']['message']}", toastColor: Colors.red);

      emit(FailedSignUpState());
    }
  }

  void clearFields() {
    emailController.text = '';
    passwordController.text = '';
    registerPasswordController.text = '';
    registerEmailController.text = '';
    registerNameController.text = '';
  }
}
