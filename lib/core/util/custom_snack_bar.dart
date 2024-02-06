import 'package:flutter/material.dart';
import 'package:adivinanza/core/util/app_color.dart';

ScaffoldFeatureController customSnackBar(
  BuildContext context, {
  bool isSuccess = false,
  required String content,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: isSuccess ? AppColors().successful : AppColors().error,
    content: Text(
      content,
      style: TextStyle(color: AppColors().textColor, letterSpacing: 0.5),
    ),
  ));
}
