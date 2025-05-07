import 'package:flutter/material.dart';
import 'package:news/Utils/AppStyle.dart';

import 'AppColors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      secondaryHeaderColor: AppColors.primaryLight,
      cardColor: AppColors.darkGray,
      primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.primaryDark,
      textTheme: TextTheme(
          headlineLarge: AppStyle.bold24primaryLight,
          headlineMedium: AppStyle.bold16primaryLight,
          headlineSmall: AppStyle.medium14primaryLight,
          titleMedium: AppStyle.medium16primaryLight,
          bodySmall: AppStyle.light12darkGray,
          bodyLarge: AppStyle.bold20primaryDark,
          labelLarge: AppStyle.bold20primaryLight,
          bodyMedium: AppStyle.medium20primaryDark));
  static final ThemeData lightTheme = ThemeData(
      secondaryHeaderColor: AppColors.primaryDark,
      cardColor: AppColors.lightGray,
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.primaryLight,
      textTheme: TextTheme(
          labelLarge: AppStyle.bold20primaryDark,
          headlineLarge: AppStyle.bold24primaryDark,
          headlineMedium: AppStyle.bold16primaryDark,
          headlineSmall: AppStyle.medium14primaryDark,
          titleMedium: AppStyle.medium16primaryDark,
          bodySmall: AppStyle.light12darkGray,
          bodyLarge: AppStyle.bold20primaryLight,
          bodyMedium: AppStyle.medium20primaryLight));
}
