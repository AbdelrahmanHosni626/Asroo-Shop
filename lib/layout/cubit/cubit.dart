import 'package:asroo_shop/layout/cubit/states.dart';
import 'package:asroo_shop/modules/favorites/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/category/category_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../../shared/network/remote/dio_helper.dart';

class AsrooShopCubit extends Cubit<AsrooShopStates> {
  AsrooShopCubit() : super(AsrooInitialState());

  static AsrooShopCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(AsrooChangeThemeModeState());
  }

  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'Asroo Shop',
    'Categories',
    'Favorites',
    'Settings',
  ];

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AsrooShopChangeBottomNavBarState());
  }

  List<dynamic> products = [];

  void getProducts() {
    if (products.isEmpty) {
      emit(AsrooShopGetProductsLoadingState());

      DioHelper.getData(
        url: '/products',
      ).then((value) {
        products = value.data;
        print('===================================================');
        print(products.length);
        print('===================================================');
        print(products.toString());

        emit(AsrooShopGetProductsSuccessState());
      }).catchError((error) {
        print(error.toString());

        emit(AsrooShopGetProductsErrorState(error.toString()));
      });
    } else {
      emit(AsrooShopGetProductsSuccessState());
    }
  }
}
