import 'package:asroo_shop/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode()
  {
    isDark = !isDark;
    emit(AppChangeAppModeState());
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility : Icons.visibility_off;

    emit(AppChangePasswordVisibilityState());
  }
}