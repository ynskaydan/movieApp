import 'package:flutter/material.dart';

class MyAppThemes {
  static ThemeData myAppLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black)),
    );
  }
}
