import 'package:asroo_shop/layout/cubit/cubit.dart';
import 'package:asroo_shop/layout/cubit/states.dart';
import 'package:asroo_shop/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';
import '../product_details/product_details_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsrooShopCubit, AsrooShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var list = AsrooShopCubit.get(context).searchForProduct;
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: AppBar(
              leading: backButton(context),
              title: const Text('Search'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onFieldSubmitted: (c) {
                      FocusScope.of(context).unfocus;
                    },
                    controller: AsrooShopCubit.get(context).searchController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      AsrooShopCubit.get(context).addSearchToList(value);
                      print(value);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.red,
                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          AsrooShopCubit.get(context).clearSearch();
                        },
                        icon: const Icon(Icons.close),
                      ),
                      hintText: 'Search you\'re looking for',
                      hintStyle: const TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                productsBuilder(context, list, isSearch: true),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget productsBuilder(context, list, {isSearch = false}) =>
      ConditionalBuilder(
        condition: AsrooShopCubit.get(context).searchForProduct.isNotEmpty,
        builder: (BuildContext context) => Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1 / 1.70,
            children: List.generate(
              AsrooShopCubit.get(context).searchForProduct.length,
                  (index) {
                if (AsrooShopCubit.get(context)
                    .searchForProduct
                    .isNotEmpty
                ) {
                  return buildProductItem(
                      context,
                      AsrooShopCubit.get(context).searchForProduct[index],
                      index);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
        fallback: (BuildContext context) =>
            isSearch ? Container() : const CircularProgressIndicator(),
      );

  Widget buildProductItem(context, product, index) => InkWell(
        onTap: () {
          navigateTo(context, ProductDetailsScreen());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            decoration: BoxDecoration(
              color: AsrooShopCubit.get(context).isDark
                  ? darkGreyColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color:
                    AsrooShopCubit.get(context).isDark ? pinkColor : mainColor,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        AsrooShopCubit.get(context).getFavorites(product['id']);
                      },
                      icon:
                          AsrooShopCubit.get(context).isFavorites(product['id'])
                              ? Icon(
                                  Icons.favorite,
                                  color: AsrooShopCubit.get(context).isDark
                                      ? pinkColor
                                      : mainColor,
                                )
                              : Icon(
                                  Icons.favorite_border_outlined,
                                  color: AsrooShopCubit.get(context).isDark
                                      ? pinkColor
                                      : mainColor,
                                ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        AsrooShopCubit.get(context)
                            .addProductToCart(product[index]);
                      },
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: AsrooShopCubit.get(context).isDark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${product['image']}',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: defaultText(
                    text: '${product['title']}',
                    color: AsrooShopCubit.get(context).isDark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 18,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      defaultText(
                        text: '\$ ${product['price']}',
                        fontSize: 16,
                        color: AsrooShopCubit.get(context).isDark
                            ? Colors.white
                            : Colors.black,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AsrooShopCubit.get(context).isDark
                                ? pinkColor
                                : mainColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              defaultText(
                                text: '${product['rating']['rate']}',
                                fontSize: 16,
                                color: AsrooShopCubit.get(context).isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
