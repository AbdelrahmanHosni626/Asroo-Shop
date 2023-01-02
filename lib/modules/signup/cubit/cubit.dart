import 'package:asroo_shop/models/user/user_model.dart';
import 'package:asroo_shop/modules/signup/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(SignupChangePasswordVisibilityState());
  }

  void signUp({
    required String userName,
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        userName: userName,
        email: email,
        uId: value.user!.uid,
      );
      emit(SignUpSuccessState());
    }).catchError((error) {
      emit(SignUpErrorState(error.toString()));
    });
  }

  void userCreate({
    required String userName,
    required String email,
    required String uId,
  }) {
    UserModel model = UserModel(
      userName: userName,
      email: email,
      uId: uId,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
      emit(SignUpCreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignUpCreateUserErrorState(error.toString()));
    });
  }
}
