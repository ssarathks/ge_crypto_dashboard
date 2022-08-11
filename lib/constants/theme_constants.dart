import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_constants.dart';

class ThemeConstants {
  static double scaffoldHorizontalPadding = 15;

  static ThemeData lightTheme = ThemeData(
    // primarySwatch: ColorConstants.primarySwatchColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ColorConstants.lightThemeScaffoldColor,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorConstants.lightThemeScaffoldColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light),
      iconTheme: IconThemeData(color: Colors.black),
      // titleTextStyle: TextStyle(
      //     color: ColorConstants.primaryBlue,
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold
      // ),
    ),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(
    //     fontSize: 16
    //   )
    // ),
    // popupMenuTheme: PopupMenuThemeData(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //   textStyle: const TextStyle(
    //     color: Colors.black87
    //   )
    // ),
    // cardTheme: CardTheme(
    //   color: const Color(0xFFFFFFFF),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(15)
    //   ),
    //   elevation: 0
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.black, unselectedItemColor: Colors.black26),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    ),
    scaffoldBackgroundColor: ColorConstants.lightThemeScaffoldColor,

    // scaffoldBackgroundColor: const Color(0xFFE29090),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // progressIndicatorTheme: const ProgressIndicatorThemeData(
    //   color: Colors.white
    // ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: ColorConstants
            .darkThemeScaffoldColor, // THIS VALUE IS THE SAME AS DARK THEME DEFAULT CARD COLOR
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorConstants
                .darkThemeScaffoldColor, // THIS VALUE IS THE SAME AS DARK THEME DEFAULT CARD COLOR
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light)),
    cardTheme: const CardTheme(
      color: const Color.fromARGB(255, 44, 44, 44),
    ),
    scaffoldBackgroundColor: ColorConstants.darkThemeScaffoldColor,
  );
}
