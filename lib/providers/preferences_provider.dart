import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dragonballwiki/theme/themes.dart';

class AppData extends ChangeNotifier {
  bool _themeDark = false;
  bool get themeDark => _themeDark;

  late final TextTheme baseTextTheme;
  late final MaterialTheme themeApp;
  late ThemeData lightTheme;
  late ThemeData darkTheme;

  ThemeData get themeHoleApp => _themeDark ? darkTheme : lightTheme;

  AppData() {
    baseTextTheme = Typography.material2021().black;
    themeApp = MaterialTheme(baseTextTheme);
    lightTheme = themeApp.goku();
    darkTheme = themeApp.vegeta();
    _loadThemePreference(); // Cargamos preferencia al iniciar
  }

  void boolState(bool isDark) {
    _themeDark = isDark;
    notifyListeners();
    _saveThemePreference(); // Guardamos al cambiar
  }

  void _rebuildThemes() {
    final baseTextTheme = Typography.material2021().black;
    final MaterialTheme themeApp = MaterialTheme(baseTextTheme);
    lightTheme = themeApp.goku();
    darkTheme = themeApp.vegeta();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _themeDark = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners(); // Notificamos porque esto corre después del constructor
  }

  Future<void> _saveThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', _themeDark);
  }
}
