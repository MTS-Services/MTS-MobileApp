import 'package:flutter/material.dart';

class HelperFunction {
  HelperFunction._();
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
