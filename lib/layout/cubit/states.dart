abstract class AsrooShopStates {}

class AsrooInitialState extends AsrooShopStates {}

class AsrooChangeThemeModeState extends AsrooShopStates {}

class AsrooShopChangeBottomNavBarState extends AsrooShopStates {}

class AsrooShopGetProductsLoadingState extends AsrooShopStates {}

class AsrooShopGetProductsSuccessState extends AsrooShopStates {}

class AsrooShopGetProductsErrorState extends AsrooShopStates {
  final String error;

  AsrooShopGetProductsErrorState(this.error);
}

class AsrooShopGetSingleProductLoadingState extends AsrooShopStates {}

class AsrooShopGetSingleProductSuccessState extends AsrooShopStates {}

class AsrooShopGetSingleProductErrorState extends AsrooShopStates {
  final String error;

  AsrooShopGetSingleProductErrorState(this.error);
}

class AsrooShopGetFavoritesState extends AsrooShopStates {}

class AsrooShopAddToFavoritesState extends AsrooShopStates {}