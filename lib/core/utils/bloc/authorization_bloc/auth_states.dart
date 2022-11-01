import 'package:orange_interview/models/user_model.dart';

abstract class AuthStates {}

class InitAuthState extends AuthStates {}

class LoadingLoginState extends AuthStates {}

class SuccessLoginState extends AuthStates {
  late User userModel;

  SuccessLoginState(this.userModel);
}

class FailedLoginState extends AuthStates {}

class SuccessSignUpState extends AuthStates {
  late User userModel;

  SuccessSignUpState(this.userModel);
}

class FailedSignUpState extends AuthStates {}

class LoadingSignUpState extends AuthStates {}
