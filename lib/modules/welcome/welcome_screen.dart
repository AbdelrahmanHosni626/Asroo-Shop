import 'package:asroo_shop/modules/login/login_screen.dart';
import 'package:asroo_shop/modules/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: defaultText(
                      text: 'Welcome',
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      textDecoration: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultText(
                        text: 'Asroo',
                        fontSize: 36,
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.none,
                      ),
                      const SizedBox(width: 7),
                      defaultText(
                        text: 'Shop',
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        textDecoration: TextDecoration.none,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 250),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  onPressed: ()
                  {
                    navigateTo(context, LoginScreen());
                  },
                  child: defaultText(
                    text: 'Get Start',
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
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
                      onPressed: ()
                      {
                        navigateTo(context, SignupScreen());
                      },
                      child: defaultText(
                        text: 'Sign Up',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
