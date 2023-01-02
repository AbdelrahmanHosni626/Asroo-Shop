abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupChangeAppModeState extends SignupStates {}

class SignupChangePasswordVisibilityState extends SignupStates {}

class SignUpLoadingState extends SignupStates {}

class SignUpSuccessState extends SignupStates {}

class SignUpErrorState extends SignupStates {
  final String error;

  SignUpErrorState(this.error);
}

class SignUpCreateUserSuccessState extends SignupStates {}

class SignUpCreateUserErrorState extends SignupStates {
  final String error;

  SignUpCreateUserErrorState(this.error);
}