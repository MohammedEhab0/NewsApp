import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProviders extends ChangeNotifier {
  String currentLanguage = 'en';
  ThemeMode themeMode = ThemeMode.light;

  SettingProviders() {
    loadSettings();
  }

  Future<void> loadSettings() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();

    // Load saved language
    String? savedLanguage = sharedPreference.getString('currentLanguage');
    if (savedLanguage != null) {
      currentLanguage = savedLanguage;
    }

    // Load saved theme mode
    String? savedTheme = sharedPreference.getString('themeMode');
    if (savedTheme != null) {
      themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }

    notifyListeners(); // Notify listeners after loading settings
  }

  void changeLanguage(BuildContext context, String newLanguage) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if (newLanguage == currentLanguage) return;

    await sharedPreference.setString('currentLanguage', newLanguage);
    currentLanguage = newLanguage;
    context.setLocale(Locale(currentLanguage));
    notifyListeners();
  }

  void changeTheme(ThemeMode newThemeMode) async {
    if (newThemeMode == themeMode) return;

    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setString('themeMode', newThemeMode == ThemeMode.dark ? 'dark' : 'light');

    themeMode = newThemeMode;
    notifyListeners();
  }
}