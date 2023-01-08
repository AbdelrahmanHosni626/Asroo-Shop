import 'package:asroo_shop/layout/cubit/states.dart';
import 'package:asroo_shop/models/products/product_model.dart';
import 'package:asroo_shop/modules/favorites/favorites_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user/user_model.dart';
import '../../modules/category/category_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../../shared/components/constants.dart';
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
    existingIndex =
        favorites.indexWhere((element) => element['id'] == productId);

    if (existingIndex >= 0) {
      favorites.removeAt(existingIndex);
    } else {
      favorites.add(
        products.firstWhere((element) => element['id'] == productId),
      );
    }
    emit(AsrooShopGetFavoritesState());
  }

  bool isFavorites(int productId) {
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

  final List<ProductsModel> productToCart = [];

  Map quantity()
  {
    var quantity = {};
    productToCart.forEach((element) {
      if (quantity.containsKey(ProductsModel)) {
        quantity[ProductsModel] += 1;
        quantity.entries.map((e) => e.key.price * e.value).toList();
        print(quantity.values.toString());
      } else {
        quantity[ProductsModel] = 1;
        print(quantity.values.toString());
      }
    });
    emit(AsrooShopAddToCartState());
    return quantity;
  }

  var productMap = {};

  void addProductToCart(ProductsModel productsModel) {
    if (productMap.containsKey(ProductsModel)) {
      productMap[ProductsModel] += 1;
      productMap.entries.map((e) => e.key.price * e.value).toList();
      print(productMap.values.toString());
    } else {
      productMap[productsModel] = 1;
      print(productMap.values.toString());
    }
    emit(AsrooShopAddToCartState());
  }


  UserModel? userModel;

  void getUserData() {
    emit(AsrooShopGetUserDataLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      emit(AsrooShopGetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AsrooShopGetUserDataErrorState(error.toString()));
    });
  }


  List<String> languages = ['Arabic 🇸🇦', 'English 🇬🇧󠁧󠁢󠁥󠁮󠁧󠁿', 'France 🇫🇷󠁧󠁢󠁥󠁮󠁧󠁿'];
  String? selectedLang;
}
