import 'package:asroo_shop/modules/login/login_screen.dart';
import 'package:asroo_shop/shared/components/constants.dart';
import 'package:asroo_shop/shared/cubit/cubit.dart';
import 'package:asroo_shop/shared/cubit/states.dart';
import 'package:asroo_shop/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/components.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);

        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: backButton(context),
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.changeAppMode();
                  },
                  icon: cubit.isDark
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: mediaQuery.size.height * 0.891,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 40,
                              left: 20,
                              right: 20,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    defaultText(
                                      text: 'SIGN',
                                      color:
                                          cubit.isDark ? pinkColor : mainColor,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(width: 3),
                                    defaultText(
                                      text: 'UP',
                                      color: cubit.isDark
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 50),
                                defaultFormField(
                                  controller: nameController,
                                  inputType: TextInputType.name,
                                  hint: 'User Name',
                                  prefix: Icons.person,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'User Name is required';
                                    } else if (value.length <= 3 ||
                                        !RegExp(validationName)
                                            .hasMatch(value)) {
                                      return 'Enter a valid user name';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                                defaultFormField(
                                  controller: emailController,
                                  inputType: TextInputType.emailAddress,
                                  hint: 'Email',
                                  prefix: Icons.email,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email is required';
                                    } else if (value.length <= 3 ||
                                        !RegExp(validationEmail)
                                            .hasMatch(value)) {
                                      return 'Enter a valid Email Address';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                                defaultFormField(
                                  controller: passwordController,
                                  inputType: TextInputType.visiblePassword,
                                  hint: 'Password',
                                  prefix: Icons.lock,
                                  isPassword: cubit.isPassword,
                                  suffix: cubit.suffix,
                                  suffixPressed: (){
                                    cubit.changePasswordVisibility();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password is required';
                                    } else if (value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSubmit: (value)
                                  {
                                    if (formKey.currentState!.validate())
                                    {
                                      print(nameController.text);
                                      print(emailController.text);
                                      print(passwordController.text);

                                      navigateTo(context, LoginScreen());
                                    }
                                  }
                                ),
                                const SizedBox(height: 50),
                                defaultButton(
                                  function: ()
                                  {
                                    if (formKey.currentState!.validate())
                                      {
                                        print(nameController.text);
                                        print(emailController.text);
                                        print(passwordController.text);

                                        navigateTo(context, LoginScreen());
                                    }
                                  },
                                  text: 'SIGN UP',
                                  fontSize: 20,
                                  width: double.infinity,
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: cubit.isDark ? pinkColor : mainColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  defaultText(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    text: "Already have an Account?",
                                    color: Colors.white,
                                    textDecoration: TextDecoration.none,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(context, LoginScreen());
                                    },
                                    child: defaultText(
                                      text: 'LOG IN',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      textDecoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
