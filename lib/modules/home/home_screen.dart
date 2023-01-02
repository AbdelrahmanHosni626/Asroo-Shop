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
        return ConditionalBuilder(
          condition: true,
          builder: (context) => buildHome(context),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildHome(context) => SingleChildScrollView(
    scrollDirection: Axis.vertical,
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: AsrooShopCubit.get(context).isDark ? pinkColor : mainColor,
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
                          borderSide: const BorderSide(color: Colors.white),
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
                  color: AsrooShopCubit.get(context).isDark ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildGridView(context),
          ],
        ),
      ],
    ),
  );

  Widget buildGridView(context) => GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    mainAxisSpacing: 15,
    crossAxisSpacing: 5,
    childAspectRatio: 1 / 1.40,
    children: List.generate(10, (index) => buildCardItem(context)),
  );


  Widget buildCardItem(context) => Container(
    decoration: BoxDecoration(
      color: AsrooShopCubit.get(context).isDark ? darkGreyColor : Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 3,
          blurRadius: 5,
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_outlined,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart,
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
            image: const DecorationImage(
              image: NetworkImage(
                'https://img.freepik.com/free-psd/magenta-color-3d-style-color-off-year-2023-text-effect_47987-13412.jpg?w=740&t=st=1672359006~exp=1672359606~hmac=e18ca13e2ad003c3bad1a51d7a482d47d1ba23573aa2127d165df79e718b70e1',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        defaultText(
          text: 'Product Name',
          color: Colors.black,
          fontSize: 18,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            defaultText(
              text: '\$ 15',
              color: Colors.black87,
            ),
            const SizedBox(width: 50),
            Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    defaultText(text: '4.7',),
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
      ],
    ),
  );
}
