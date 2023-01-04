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

  List<dynamic> favorites = [];
  bool isFavorite = false;
  late int existingIndex;

  void getFavorites(int productId) {
    existingIndex = favorites.indexWhere((element) => element['id'] == productId);

    if(existingIndex >= 0)
      {
        favorites.removeAt(existingIndex);
      } else {
      favorites.add(
        products.firstWhere((element) => element['id'] == productId),
      );
    }
    emit(AsrooShopGetFavoritesState());
  }
  
  bool isFavorites(int productId)
  {
    return favorites.any((element) => element['id'] == productId);
  }


  List<dynamic> productDetails = [];

  void getSingleProduct() {
    if (productDetails.isEmpty) {
      emit(AsrooShopGetSingleProductLoadingState());

      DioHelper.getData(
        url: '/products/1',
      ).then((value) {
        productDetails = value.data;
        emit(AsrooShopGetSingleProductSuccessState());
      }).catchError((error) {
        print(error.toString());

        emit(AsrooShopGetSingleProductErrorState(error.toString()));
      });
    } else {
      emit(AsrooShopGetSingleProductSuccessState());
    }
  }
}
