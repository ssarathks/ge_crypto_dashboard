import 'package:flutter/material.dart';

class ColorConstants {
  static const Color lightThemeScaffoldColor =
      Color.fromARGB(255, 241, 243, 245);
  static const Color darkThemeScaffoldColor = Color.fromARGB(255, 32, 32, 32);

  static Color getScaffoldColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? darkThemeScaffoldColor
        : lightThemeScaffoldColor;
  }
}
