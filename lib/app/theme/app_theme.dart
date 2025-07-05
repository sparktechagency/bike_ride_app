import 'package:bike_ride_app/app/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get lightThemeData {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
        colorSchemeSeed: AppColors.primaryColor,
        // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
        ),


      bottomSheetTheme: BottomSheetThemeData(
      )

    );
  }

  static ThemeData get darkThemeData {
    return ThemeData(
      colorSchemeSeed: AppColors.primaryColor,
      brightness: Brightness.dark,
    );
  }
}