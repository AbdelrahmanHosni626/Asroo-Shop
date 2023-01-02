import 'package:asroo_shop/layout/HomeLayoutScreen.dart';
import 'package:asroo_shop/shared/bloc_observer.dart';
import 'package:asroo_shop/shared/cubit/cubit.dart';
import 'package:asroo_shop/shared/cubit/states.dart';
import 'package:asroo_shop/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: HomeLayoutScreen(),
          );
        },
      ),
    );
  }
}
