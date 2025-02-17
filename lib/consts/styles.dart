import 'package:flutter/material.dart';
import 'package:smart_shop_v1/consts/app_colors.dart';

class Styles {
  static ThemeData themeData({required bool isDark, required BuildContext}) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDark ? AppColors.darkScaffoldColor : AppColors.lightScaffoldColor,
        cardColor:
            isDark ? Color.fromARGB(255, 13, 6, 37) : AppColors.lightCardColor,
        brightness: isDark ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(
            iconTheme:
                IconThemeData(color: isDark ? Colors.white : Colors.black)));
  }
}
