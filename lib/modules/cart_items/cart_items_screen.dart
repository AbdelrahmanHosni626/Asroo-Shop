import 'package:asroo_shop/layout/HomeLayoutScreen.dart';
import 'package:asroo_shop/layout/cubit/cubit.dart';
import 'package:asroo_shop/layout/cubit/states.dart';
import 'package:asroo_shop/shared/components/components.dart';
import 'package:asroo_shop/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsScreen extends StatelessWidget {
  const CartItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsrooShopCubit, AsrooShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AsrooShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            leading: backButton(context),
            title: Center(
              child: defaultText(
                text: 'Cart Items',
                fontSize: 30,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  cubit.changeAppMode();
                },
                icon: const Icon(
                  Icons.backspace_outlined,
                  size: 25,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .8,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => listBuilder(context),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultText(
                            text: 'Total',
                            color: AsrooShopCubit.get(context).isDark
                                ?Colors.white
                                :Colors.black45,
                          ),
                          const SizedBox(height: 10),
                          defaultText(
                            text: '\$ 100.98',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AsrooShopCubit.get(context).isDark
                                ?Colors.white
                                :Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children:
                              [
                                defaultText(
                                  text: 'Check Out',
                                  fontSize: 20,
                                ),
                                const SizedBox(width: 10),
                                const Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                              ],
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
        );
      },
    );
  }

  Widget listBuilder(context) => Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            color: AsrooShopCubit.get(context).isDark
                ? pinkColor.withOpacity(0.7)
                : mainColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://img.freepik.com/premium-photo/decorated-christmas-tree-new-year-blurred-cityscape-winter-background_183314-10797.jpg?w=740',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultText(
                      text:
                          'Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title ',
                      color: AsrooShopCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    defaultText(
                      text: '\$ 109.00',
                      color: AsrooShopCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle,
                          color: AsrooShopCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      defaultText(
                        text: '1',
                        color: AsrooShopCubit.get(context).isDark
                            ? Colors.white
                            : Colors.black,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          color: AsrooShopCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: AsrooShopCubit.get(context).isDark
                          ? Colors.white
                          : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget conditionFallBack(context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: MediaQuery.of(context).size.width * .5,
              color: AsrooShopCubit.get(context).isDark
                  ? Colors.white
                  : Colors.black,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                defaultText(
                  text: 'Your Cart is ',
                  color: AsrooShopCubit.get(context).isDark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                defaultText(
                  text: 'Empty',
                  color: AsrooShopCubit.get(context).isDark
                      ? pinkColor
                      : mainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(height: 5),
            defaultText(
              text: 'Add Items to get started',
              color: AsrooShopCubit.get(context).isDark
                  ? Colors.white
                  : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 40),
            defaultButton(
              text: 'Go Home',
              function: () {
                navigateAndFinish(context, HomeLayoutScreen());
              },
            ),
          ],
        ),
      );
}
