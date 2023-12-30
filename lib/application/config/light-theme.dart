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
    labelSmall: TextStyle(
      fontWeight: FontWeight.w300,
      color: AppColors.greyLight,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.greyLight,
      fontSize: 16,
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(
      color: AppColors.primaryColorDarker,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    toolbarTextStyle: TextStyle(
      color: AppColors.primaryColorDarker,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    iconTheme: IconThemeData(color: AppColors.primaryColorDarker),
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
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xffeff5fe),
    filled: true,
    labelStyle: const TextStyle(
      color: AppColors.primaryColorDarker,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
      )
    ),
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    background: Colors.white,
    seedColor: AppColors.primaryColor
  ),
);
