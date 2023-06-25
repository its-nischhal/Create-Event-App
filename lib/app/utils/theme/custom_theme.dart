import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomTheme {
  static ThemeData lightTheme() {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Colors.grey.shade300,
        width: 1,
      ),
    );
    return ThemeData(
      fontFamily: 'OpenSans-Regular',
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      primaryColor: ColorConstants.primaryColor,
      colorScheme:
          const ColorScheme.light(primary: ColorConstants.primaryColor),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade50,
        border: outlineInputBorder,
        iconColor: Colors.blue,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        focusColor: Colors.blue,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        enabledBorder: outlineInputBorder,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        prefixIconColor: ColorConstants.textFieldIconColor,
        suffixIconColor: ColorConstants.textFieldIconColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ColorConstants.primaryColor,
          shadowColor: ColorConstants.shadowColor,
          elevation: 5,
          padding: const EdgeInsetsDirectional.only(start: 30.0, end: 30.0),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: ColorConstants.primaryColor),
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: Typography.whiteMountainView.titleLarge?.copyWith(
          color: ColorConstants.primaryColor,
          fontFamily: 'OpenSans-SemiBold',
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: Typography.whiteMountainView.titleMedium?.copyWith(
          color: ColorConstants.primaryColor,
          fontFamily: 'OpenSans-SemiBold',
          fontSize: 13.0,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: Typography.whiteMountainView.titleSmall?.copyWith(
          color: ColorConstants.primaryColor,
          fontFamily: 'OpenSans-SemiBold',
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: Typography.whiteMountainView.bodyLarge?.copyWith(
          color: ColorConstants.primaryColor,
          fontFamily: 'OpenSans-Regular',
          fontSize: 14.0,
        ),
        bodyMedium: Typography.whiteMountainView.bodyMedium?.copyWith(
          color: ColorConstants.blackColor,
          fontFamily: 'OpenSans-Regular',
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: Typography.whiteMountainView.bodySmall?.copyWith(
          color: ColorConstants.primaryColor,
          fontFamily: 'OpenSans-Regular',
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  static ThemeData darkTheme() => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );
}
