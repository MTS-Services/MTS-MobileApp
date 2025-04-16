import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mts_app/src/view/screen/home_screen.dart';
import 'package:mts_app/utils/theme/theme.dart';

class MtsApp extends StatelessWidget {
  const MtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home:HomeScreen(),
    );
  }
}
