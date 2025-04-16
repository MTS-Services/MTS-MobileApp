import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/app_colors.dart';

class CustomActionWidget extends StatefulWidget {
  const CustomActionWidget({super.key});

  @override
  State<CustomActionWidget> createState() => _CustomActionWidgetState();
}

class _CustomActionWidgetState extends State<CustomActionWidget> {
  final RxBool showSearchBar = true.obs;

  void changeAction() {
    showSearchBar.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return showSearchBar.value
          ? IconButton(
              onPressed: changeAction,
              icon: Icon(Iconsax.search_normal),
            )
          : SizedBox(
              width: 250,
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  suffixIcon: Icon(Iconsax.search_normal),
                ),
              ),
            );
    });
  }
}
