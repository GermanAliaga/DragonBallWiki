import 'package:flutter/material.dart';
import 'package:maqueta_3/theme/themes.dart';

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
  }

  void boolState(bool boolCounter) {
    _themeDark = boolCounter;
    notifyListeners();
  }

  void _rebuildThemes() {
    final baseTextTheme = Typography.material2021().black;
    final MaterialTheme themeApp =
        MaterialTheme(baseTextTheme);
    lightTheme = themeApp.goku();
    darkTheme = themeApp.vegeta();
  }
}