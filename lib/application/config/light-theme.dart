import 'package:flutter/material.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.primaryColorDarker,
      fontSize: 32,
    ),
    headlineMedium: TextStyle(
      color: AppColors.primaryColorDarker,
      fontSize: 28,
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.primaryColorDarker,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      elevation: MaterialStateProperty.all<double>(0),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor:  MaterialStateProperty.all<Color>(AppColors.secondaryColor),
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
);
