import 'package:asroo_shop/layout/cubit/cubit.dart';
import 'package:asroo_shop/shared/components/components.dart';
import 'package:asroo_shop/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/assets.dart';
import '../../layout/cubit/states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsrooShopCubit, AsrooShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var list = AsrooShopCubit.get(context).favorites;

        return ConditionalBuilder(
          condition: list.isNotEmpty,
          builder: (context) => favoriteBuilder(context),
          fallback: (context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.imagesHeart,
                  width: 200,
                  color: Colors.grey,
                ),
                defaultText(
                  text: 'Please, Add your favorite Products',
                  color: Colors.grey,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget favoriteBuilder(context) => ListView.separated(
        itemBuilder: (context, index) => buildFavoriteItem(context, AsrooShopCubit.get(context).favorites[index],),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Divider(
            thickness: 1,
            color: AsrooShopCubit.get(context).isDark
                ? Colors.white
                : Colors.black,
          ),
        ),
        itemCount: AsrooShopCubit.get(context).favorites.length,
      );

  Widget buildFavoriteItem(context, favorites) => Row(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  '${favorites['image']}',
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultText(
                  text:
                      '${favorites['title']}',
                  color: AsrooShopCubit.get(context).isDark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 18,
                  maxLines: 3,
                  textOverflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                defaultText(
                  text: '${favorites['price']}',
                  color: Colors.grey.shade600,
                  fontSize: 18,
                  maxLines: 3,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: ()
            {
              AsrooShopCubit.get(context).getFavorites(favorites['id']);
            },
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: AsrooShopCubit.get(context).isDark
                  ? pinkColor
                  : mainColor,
            ),
          ),
        ],
      );
}
