// lib/widgets/app_drawer.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mts_app/core/app_colors.dart';
import 'package:mts_app/core/image_path.dart';
import 'package:mts_app/src/view/controllers/theme_mode_controller.dart';
import 'package:mts_app/src/view/screen/today_task_screen.dart';
import 'package:mts_app/src/view/widget/custom_drawer_icon.dart';
import 'package:mts_app/src/view/widget/custom_toggle_switch.dart';
import 'package:mts_app/utils/helper/helper_function.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    final controller = Get.find<ThemeController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: dark ? AppColors.bgColor : Colors.grey[300]),
            child: Image(
                image: AssetImage(
                    dark ? ImagePath.appLogoLight : ImagePath.appLogoDark)),
          ),
          CustomDrawerIcon(
              title: 'Home', icon: Icon(Iconsax.home), onTap: () {}),
          CustomDrawerIcon(
              title: 'Projects', icon: Icon(Iconsax.activity), onTap: () {}),
          CustomDrawerIcon(
              title: 'Today\'s Task',
              icon: Icon(Iconsax.task_square),
              onTap: () => Get.to(() => TodayTaskScreen())),
          CustomDrawerIcon(
              title: 'Performance', icon: Icon(Iconsax.trend_up), onTap: () {}),
          CustomDrawerIcon(
              title: 'User Profile',
              icon: Icon(Iconsax.profile_circle),
              onTap: () {}),
          Obx(
            () {
              final isDark = controller.isDark.value;
              return CustomToggleSwitch(isDark: isDark, controller: controller);
            },
          )
        ],
      ),
    );
  }
}

