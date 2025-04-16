import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mts_app/mts_app.dart';
import 'package:mts_app/src/view/controllers/theme_mode_controller.dart';

void main() {
  Get.lazyPut(() => ThemeController());
  runApp(const MtsApp());
}
