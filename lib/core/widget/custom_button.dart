import 'package:adivinanza/core/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:adivinanza/core/util/app_color.dart';

enum CustomButtonEnum {
  enable,
  disable,
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final CustomButtonEnum state;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.state = CustomButtonEnum.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(40),
      color: _generateColor(),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 17,
              color: AppColors().textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Color _generateColor() {
    switch (state) {
      case CustomButtonEnum.enable:
        return AppColors().primaryColor;
      case CustomButtonEnum.disable:
        return AppColors().disable;
    }
  }
}
