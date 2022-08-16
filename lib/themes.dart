import 'package:flutter/material.dart';

class MyAppThemes {
  static ThemeData myAppLightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(titleMedium: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)),
        dividerColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.blue));
  }
}
