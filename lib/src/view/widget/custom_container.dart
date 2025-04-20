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
    required this.bgColor,
    required this.txColor,
    this.horizontal =0,
    this.szWidth = 0,
  });

  final double height;
  final double width;
  final String title;
  final String count;
  final IconData? icon;
  final double fontSize;
  final Color bgColor;
  final Color txColor;
  final double horizontal ;
  final double szWidth;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:dark?AppColors.secondaryDark : AppColors.primaryLight,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: dark ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.3),
            offset: Offset(2, 4),
            spreadRadius: 1,
            blurRadius: 8,
          )
        ],

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
              SizedBox(width: szWidth,),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ],
          ),

         Padding(
            padding: EdgeInsets.symmetric(horizontal:horizontal ),
            child: Text(
              '\$$count',
              style: TextStyle(
                color: txColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
