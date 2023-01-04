import 'package:asroo_shop/layout/cubit/cubit.dart';
import 'package:asroo_shop/layout/cubit/states.dart';
import 'package:asroo_shop/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsrooShopCubit, AsrooShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AsrooShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            leading: backButton(context),
            title: Center(child: defaultText(text: 'Product')),
            actions: [
              IconButton(
                onPressed: () {
                  cubit.changeAppMode();
                },
                icon: const Icon(
                  Icons.shopping_basket,
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              Container(
                width: 300,
                height: 330,
                decoration: BoxDecoration(
                  color: AsrooShopCubit.get(context).isDark
                      ? darkGreyColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AsrooShopCubit.get(context).isDark
                        ? pinkColor
                        : mainColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: 260,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1672296055536-1ab457c6a58c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1335&q=80',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            //AsrooShopCubit.get(context).getFavorites(product['id']);
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 40,
                            color: AsrooShopCubit.get(context).isDark
                                ? pinkColor
                                : mainColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: defaultText(
                              text: 'Title',
                              fontSize: 16,
                              maxLines: 3,
                              textOverflow: TextOverflow.ellipsis,
                              color: AsrooShopCubit.get(context).isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                              color: productColor,
                              border: Border.all(
                                color: AsrooShopCubit.get(context).isDark
                                    ? pinkColor
                                    : mainColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                child: defaultText(
                                  text: '\$ 130.00',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        defaultText(
                          text: 'Description',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 35,
                        ),
                        const SizedBox(width: 5),
                        defaultText(
                          text: '(5.0)',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    defaultText(
                        text:
                            'Embroidered front panels Embroidered border Plain dyed back Printed sleeves Printed cotton net dupatta Plain dyed trouser. LAWN EMBROIDERED,  Newest Products,  PKR 7000 - 12999,  Products,  Sobia Nazir,  Sobia Nazir Luxury Lawn',
                        color: Colors.black,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  height: 110,
                  decoration: const BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
