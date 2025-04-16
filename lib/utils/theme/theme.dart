import 'package:flutter/material.dart';
import 'package:mts_app/core/app_colors.dart';
import 'package:mts_app/utils/theme/custom_theme/text_field_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    inputDecorationTheme: TextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    inputDecorationTheme: TextFieldTheme.darkInputDecorationTheme,
  );
}
