import 'package:flutter/material.dart';
import 'package:mts_app/utils/constants/sizes.dart';

class TextFieldTheme {
  TextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    // constraints: const BoxConstraints.expand(height: ElementSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: ElementSizes.fontSizeMd, color: Colors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ElementSizes.fontSizeSm, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.deepOrange),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: Colors.deepOrange),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    // constraints: const BoxConstraints.expand(height: ElementSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: ElementSizes.fontSizeMd, color: Colors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ElementSizes.fontSizeSm, color: Colors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.deepOrange),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ElementSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: Colors.deepOrange),
    ),
  );
}
