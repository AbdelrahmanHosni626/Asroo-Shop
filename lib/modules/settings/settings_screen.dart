import 'package:asroo_shop/layout/cubit/cubit.dart';
import 'package:asroo_shop/layout/cubit/states.dart';
import 'package:asroo_shop/modules/login/login_screen.dart';
import 'package:asroo_shop/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsrooShopCubit, AsrooShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AsrooShopCubit.get(context);
        var model = AsrooShopCubit.get(context).userModel;

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/premium-photo/decorated-christmas-tree-new-year-blurred-cityscape-winter-background_183314-10797.jpg?w=740',
                      ),
                    ),
                    const SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultText(
                          text: model!.userName!,
                          color: cubit.isDark ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        defaultText(
                          text: model.email!,
                          color: cubit.isDark ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Divider(
                  color: Colors.grey,
                  height: 1.5,
                  thickness: 2,
                ),
                const SizedBox(height: 30),
                defaultText(
                  text: 'GENERAL',
                  color: cubit.isDark ? pinkColor : mainColor,
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkSettings,
                      ),
                      child: const Icon(
                        Icons.dark_mode,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                    defaultText(
                      text: 'Dark Mode',
                      color: cubit.isDark ? Colors.white : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    Switch(
                        activeTrackColor: cubit.isDark ? pinkColor : mainColor,
                        activeColor: cubit.isDark ? pinkColor : mainColor,
                        value: cubit.isDark,
                        onChanged: (value) {
                          cubit.changeAppMode();
                        })
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkSettings,
                      ),
                      child: const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 30),
                    defaultText(
                      text: 'Language',
                      color: cubit.isDark ? Colors.white : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    Container(
                      width: 130,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: cubit.isDark ? Colors.white : Colors.black,
                              width: 2,),),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          iconSize: 25,
                          value: en,
                          onChanged: (value) {
                            en = value!;
                            },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: cubit.isDark ? Colors.white : Colors.black,
                          ),
                          items: [
                            DropdownMenuItem(
                              value: en,
                              child: defaultText(
                                text: english,
                                color: cubit.isDark ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            DropdownMenuItem(
                              value: ar,
                              child: defaultText(
                                text: arabic,
                                color: cubit.isDark ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            DropdownMenuItem(
                              value: fr,
                              child: defaultText(
                                text: france,
                                color: cubit.isDark ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: defaultText(
                            text: 'Logout',
                            color: cubit.isDark ? pinkColor : mainColor,
                          ),
                          content: const Text(
                            'Are You Sure To Logout?',
                          ),
                          actions: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    logout();
                                    navigateAndFinish(context, LoginScreen());
                                  },
                                  child: defaultText(
                                    text: 'YES',
                                    color: cubit.isDark ? pinkColor : mainColor,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: defaultText(
                                    text: 'NO',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    splashColor: cubit.isDark
                        ? pinkColor.withOpacity(.5)
                        : mainColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(12),
                    customBorder: const StadiumBorder(),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: darkSettings,
                          ),
                          child: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 30),
                        defaultText(
                          text: 'Logout',
                          color: cubit.isDark ? Colors.white : Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
