import 'package:flutter/material.dart';
import 'package:adivinanza/core/util/app_color.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validation;

  const CustomInput({
    Key? key,
    this.validation,
    required this.icon,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool isActive = false;
  final _myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _myFocusNode.addListener(() => setState(() {
          isActive = _myFocusNode.hasFocus;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isActive ? AppColors().secondary : AppColors().disable,
      ),
      child: TextFormField(
        focusNode: _myFocusNode,
        validator: widget.validation,
        controller: widget.controller,
        style: TextStyle(
          color: isActive ? AppColors().black : AppColors().textColor,
          fontWeight: FontWeight.w700,
          shadows: [
            Shadow(
              blurRadius: 8.0,
              color: AppColors().black,
              offset: const Offset(1.0, 1.0),
            ),
          ],
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          hintStyle: TextStyle(
            color: isActive ? AppColors().black : AppColors().textColor,
            fontWeight: FontWeight.w700,
            shadows: [
              Shadow(
                blurRadius: 8.0,
                color: AppColors().black,
                offset: const Offset(1.0, 1.0),
              ),
            ],
          ),
          labelStyle: TextStyle(
            color: isActive ? AppColors().black : AppColors().textColor,
            fontWeight: FontWeight.w700,
            shadows: [
              Shadow(
                blurRadius:isActive ? 5 : 8,
                color: AppColors().black,
                offset: const Offset(1.0, 1.0),
              ),
            ],
          ),
          prefixIcon: Icon(
            widget.icon,
            shadows: [
              Shadow(
                blurRadius:isActive ? 5 : 8,
                color: AppColors().black,
                offset: const Offset(1.0, 1.0),
              ),
            ],
            color: isActive ? AppColors().black : AppColors().textColor,
          ),
        ),
      ),
    );
  }
}
