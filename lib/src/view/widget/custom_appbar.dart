import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mts_app/core/app_colors.dart';
import 'package:mts_app/core/image_path.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: Colors.white,
      title: Image.asset(
        ImagePath.appLogoLight,
        height: 80,
        width: 100,
      ),
      titleSpacing: 0,
      leading: Builder(builder: (context) {
        return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Icon(Iconsax.textalign_left5));
      }),
    );
  }
}
