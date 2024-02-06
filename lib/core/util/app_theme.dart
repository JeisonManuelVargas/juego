import 'package:flutter/material.dart';
import 'package:adivinanza/core/util/app_color.dart';

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
    appBarTheme:  AppBarTheme(color: AppColors().primaryColor),
    scaffoldBackgroundColor: AppColors().primaryColor,
  );
}
