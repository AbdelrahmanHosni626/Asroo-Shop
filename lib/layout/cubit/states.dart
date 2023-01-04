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