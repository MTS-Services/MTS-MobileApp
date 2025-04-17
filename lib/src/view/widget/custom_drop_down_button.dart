import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/helper_function.dart';

class CustomDropdownButton extends StatelessWidget {
  final double height;
  final double width;
  final String selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  final Color borderColor;
  final Color textColor;
  final double borderWidth;
  final double borderRadius;
  final Color backgroundColor;
  final double fontSize;

  const CustomDropdownButton({
    super.key,
    required this.height,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.borderColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderWidth = 1,
    this.borderRadius = 10,
    this.backgroundColor = Colors.transparent,
    this.fontSize = 16,
    required this.width,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              value: selectedValue,
              onChanged: onChanged,
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize,
                    ),
                  ),
                );
              }).toList(),
              buttonStyleData: ButtonStyleData(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: borderColor, width: borderWidth),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                width: width, // Optional: match dropdown width
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: backgroundColor,
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.arrow_drop_down, color: textColor),
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: fontSize,
              ),
            )

        ),
      ),
    );
  }

}