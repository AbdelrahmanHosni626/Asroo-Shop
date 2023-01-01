import 'package:asroo_shop/shared/bloc_observer.dart';
import 'package:asroo_shop/shared/cubit/cubit.dart';
import 'package:asroo_shop/shared/cubit/states.dart';
import 'package:asroo_shop/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/welcome/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: mainColor,
              primarySwatch: swatchColor,
              appBarTheme: const AppBarTheme(
                color: Colors.white,
              ),
              inputDecorationTheme: const InputDecorationTheme(
                prefixIconColor: mainColor,
                hintStyle: TextStyle(
                  color: kColor1,
                ),
              ),
            ),

            darkTheme: ThemeData(
              scaffoldBackgroundColor: darkGreyColor,
              primaryColor: darkGreyColor,
              primarySwatch: darkSwatchColor,
              appBarTheme: const AppBarTheme(
                color: darkGreyColor,
              ),
              inputDecorationTheme: const InputDecorationTheme(
                prefixIconColor: pinkColor,
                hintStyle: TextStyle(
                  color: kColor2,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pinkColor,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: WelcomeScreen(),
          );
        },
      ),
    );
  }
}
