import 'package:flutter/cupertino.dart';

extension ContainerExtension on BuildContext {

  double get sizeHeight => MediaQuery.of(this).size.height;
  double get sizeWidth => MediaQuery.of(this).size.width;

}