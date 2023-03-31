import 'package:flutter/material.dart';
import 'package:shop_app_riverpod/app/resources/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: ColorManager.black,
      centerTitle: true,
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: ColorManager.primaryColor,
    ),
    primaryColor: ColorManager.primaryColor,
    scaffoldBackgroundColor: ColorManager.darkBackground,
  );
}
