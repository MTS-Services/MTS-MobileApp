import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mts_app/src/view/controllers/theme_mode_controller.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({
    super.key,
    required this.isDark,
    required this.controller,
  });

  final bool isDark;
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 120.0,
      height: 45.0,
      toggleSize: 40.0,
      value: isDark,
      borderRadius: 30.0,
      padding: 7.0,
      activeColor: Colors.black87,
      inactiveColor: Colors.grey.shade300,
      showOnOff: true,
      onToggle: controller.toggleTheme,
      activeText: "Dark",
      inactiveText: "Light",
      activeTextColor: Colors.white,
      inactiveTextColor: Colors.black,
      activeIcon: const Icon(Icons.dark_mode, color: Colors.white),
      inactiveIcon: const Icon(Icons.light_mode, color: Colors.amber),
      activeTextFontWeight: FontWeight.bold,
      inactiveTextFontWeight: FontWeight.bold,
      activeToggleColor: Colors.grey,
      inactiveToggleColor: Colors.white,
    );
  }
}
