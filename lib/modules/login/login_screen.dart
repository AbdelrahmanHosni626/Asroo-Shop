import 'package:asroo_shop/generated/assets.dart';
import 'package:asroo_shop/layout/HomeLayoutScreen.dart';
import 'package:asroo_shop/modules/login/cubit/cubit.dart';
import 'package:asroo_shop/modules/login/cubit/states.dart';
import 'package:asroo_shop/shared/components/constants.dart';
import 'package:asroo_shop/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is LoginSuccessState) {
            showToast(text: 'Login Successful', state: ToastStates.success);
            navigateTo(context, HomeLayoutScreen());
          } else if (state is LoginErrorState) {
            showToast(
              text: state.error,
              state: ToastStates.error,
            );
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = LoginCubit.get(context);

          return GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: backButton(context),
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
                                        text: 'LOG',
                                        color: mainColor,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(width: 5),
                                      defaultText(
                                        text: 'IN',
                                        color: Colors.black,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 50),
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
                                      suffixPressed: () {
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
                                      onSubmit: (value) {
                                        if (formKey.currentState!.validate()) {
                                          cubit.login(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      }),
                                  const SizedBox(height: 50),
                                  ConditionalBuilder(
                                    condition: state is! LoginLoadingState,
                                    builder: (BuildContext context) =>
                                        defaultButton(
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.login(
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                          );
                                        }
                                      },
                                      text: 'LOG IN',
                                      fontSize: 20,
                                      width: double.infinity,
                                      height: 50,
                                    ),
                                    fallback: (BuildContext context) =>
                                        const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: <Widget>[
                                      const Expanded(
                                        child: Divider(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: defaultText(
                                          text: 'OR',
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Expanded(
                                        child: Divider(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        iconSize: 40,
                                        icon: SvgPicture.asset(
                                          Assets.iconsFacebook,
                                          height: 40,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        iconSize: 40,
                                        icon: SvgPicture.asset(
                                          Assets.iconsGoogleIcon,
                                          height: 40,
                                        ),
                                        onPressed: () {
                                          cubit.signInWithGoogle();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.only(
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
                                      text: "Don't have an Account?",
                                      color: Colors.white,
                                      textDecoration: TextDecoration.none,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        navigateTo(context, SignupScreen());
                                      },
                                      child: defaultText(
                                        text: 'SIGN UP',
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        textDecoration:
                                            TextDecoration.underline,
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
      ),
    );
  }
}
