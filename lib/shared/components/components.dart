import 'package:asroo_shop/shared/cubit/cubit.dart';
import 'package:asroo_shop/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../styles/colors.dart';

Widget backButton(context) => IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );

Widget defaultText({
  required String text,
  Color color = Colors.white,
  double? fontSize,
  FontWeight? fontWeight,
  TextDecoration? textDecoration,
}) =>
    Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );

defaultButton({
  double? width,
  double? height,
  double? fontSize,
  required String text,
  required Function function,
}) =>
    SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        onPressed: () {
          function();
        },
        child: defaultText(
          text: text,
          fontSize: fontSize,
        ),
      ),
    );

Widget defaultFormField({
  context,
  required TextEditingController controller,
  required TextInputType inputType,
  ValueChanged<String>? onChange,
  ValueChanged<String>? onSubmit,
  VoidCallback? onTap,
  FormFieldValidator<String>? validator,
  required String hint,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isPassword = false,
}) =>
    BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return TextFormField(
          style: TextStyle(
            color: AppCubit.get(context).isDark ? Colors.white : Colors.black ,
          ),
          controller: controller,
          keyboardType: inputType,
          onChanged: onChange,
          onFieldSubmitted: onSubmit,
          onTap: onTap,
          validator: validator,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(.3),
            hintText: hint,
            prefixIcon: Icon(
              prefix,
              size: 30,
            ),
            suffixIcon: suffix != null
                ? IconButton(
              onPressed: () {
                suffixPressed!();
              },
              icon: Icon(suffix),
            )
                : null,
          ),
        );
      },
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
