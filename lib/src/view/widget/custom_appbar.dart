import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mts_app/core/app_colors.dart';
import 'package:mts_app/core/image_path.dart';

import '../../../utils/helper/helper_function.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return AppBar(
      backgroundColor:dark?AppColors.secondaryDark:AppColors.primaryLight,
      foregroundColor: Colors.white,
      title: Image.asset(
        ImagePath.appLogoLight,
        height: 80,
        width: 60,
      ),
      actions: [

        CircleAvatar(
           backgroundColor: Colors.white,
          radius: 20,
          child: Icon(Icons.person , size: 30, color:Colors.grey,),
        ),
        SizedBox(width: 15,),
      ],
      titleSpacing: 0,
      leading: Builder(builder: (context) {
        return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Icon(Iconsax.textalign_left5));
      }),
    );
  }
}
