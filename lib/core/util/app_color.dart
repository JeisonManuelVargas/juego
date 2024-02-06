import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() => _instance;

  late Color error;
  late Color black;
  late Color disable;
  late Color secondary;
  late Color textColor;
  late Color successful;
  late Color primaryColor;
  late Color backgroundColor;

  AppColors._internal() {
    black = Colors.black;
    error = const Color(0xFFCB4A24);
    disable = const Color(0xFFCDCFCE);
    secondary = const Color(0xFFFFFFFF);
    textColor = const Color(0xFFFFFFFF);
    successful = const Color(0xFF4ad295);
    primaryColor = const Color(0xFF2c5cf0);
    backgroundColor = const Color(0xFF20387b);
  }
}
