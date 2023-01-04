import 'package:asroo_shop/layout/cubit/cubit.dart';
import 'package:asroo_shop/layout/cubit/states.dart';
import 'package:asroo_shop/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsrooShopCubit, AsrooShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var list = AsrooShopCubit.get(context).products;

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: AsrooShopCubit.get(context).isDark
                          ? pinkColor
                          : mainColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          defaultText(
                            text: 'Find Your',
                            fontSize: 25,
                          ),
                          const SizedBox(height: 5),
                          defaultText(
                            text: 'INSPIRATION',
                            fontSize: 25,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: searchController,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.red,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: 'Search you\'re looking for',
                              hintStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: defaultText(
                        text: 'Categories',
                        color: AsrooShopCubit.get(context).isDark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  productsBuilder(context, list),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget productsBuilder(context, list) => ConditionalBuilder(
        condition: AsrooShopCubit.get(context).products.isNotEmpty,
        builder: (BuildContext context) => GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1 / 1.70,
          children: List.generate(
            AsrooShopCubit.get(context).products.length,
            (index) => buildProductItem(
                context, AsrooShopCubit.get(context).products[index]),
          ),
        ),
        fallback: (BuildContext context) => const CircularProgressIndicator(),
      );

  Widget buildProductItem(context, product) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          decoration: BoxDecoration(
            color: AsrooShopCubit.get(context).isDark
                ? darkGreyColor
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AsrooShopCubit.get(context).isDark ? pinkColor : mainColor,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: AsrooShopCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
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
      );
}
