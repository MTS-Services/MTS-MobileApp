import 'package:flutter/material.dart';
import 'package:mts_app/core/app_colors.dart';

import '../../../utils/helper/helper_function.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.count,
    this.icon,
    this.fontSize = 20,
  });

  final double height;
  final double width;
  final String title;
  final String count;
  final IconData? icon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: dark?Colors.transparent:Colors.grey,
            offset: Offset(2, 2),
            spreadRadius: 2,
            blurRadius: 5
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '\$$count',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
