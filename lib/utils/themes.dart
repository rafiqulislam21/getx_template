import 'package:flutter/material.dart';

class Themes {
  static Color lightPrimary = Color(0xFF121235)

      /*Color(0xfffcfcff)*/;

  static Color darkPrimary = Color(0xff2B2B4E)

      /*Colors.black*/;

  static Color lightAccent = Color(0xFF021235);
  static Color darkAccent = Colors.grey[300];
  static Color lightBG = Colors.white

      /*Color(0xfffcfcff)*/;

  static Color lightBG2 = Colors.grey[200];
  static Color lightBG3 = Colors.white

      /*Color(0xfffcfcff)*/;

  static Color darkBG = Color(0xFF121235)

      /*Color(0xff1E1E1E)*/ /*Colors.black*/;

  static Color darkBG2 = Color(0xff222340)

      /*Color(0xff333333)*/ /*Color(0xff1E1E1E)*/;

  static Color darkBG3 = Color(0xff222340)

      /*Color(0xff333333)*/;

  static Color ratingBG = Colors.yellow[600];
  static Color splashColor = Colors.green[200];

  static List<Color> gradientDark = [
    const Color(0xFF8983F7),
    const Color(0xFFA3DAFB),
  ];
  static List<Color> gradientLight = [
    const Color(0xDDFF0080),
    const Color(0xDDFF8C00),
  ];
  static var darkShadow = const <BoxShadow>[
    BoxShadow(
      color: const Color(0x66000000),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];
  static var lightShadow = const <BoxShadow>[
    BoxShadow(
      color: const Color(0xFFd8d7da),
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];

  static final light = ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      backgroundColor: lightBG,
      primaryColor: lightPrimary,
      accentColor: lightAccent,
      cursorColor: lightAccent,
      scaffoldBackgroundColor: lightBG,
      buttonColor: Colors.blueAccent,
      bottomAppBarColor: lightBG2,
      bottomAppBarTheme: BottomAppBarTheme(color: lightBG2),
      cardColor: lightBG2,
      dialogBackgroundColor: lightBG2,
      canvasColor: lightBG2,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: lightBG2,
      ));


  static final dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    buttonColor: Colors.deepOrange,
    bottomAppBarColor: darkBG2,
    bottomAppBarTheme: BottomAppBarTheme(color: darkBG2),
    cardColor: darkBG2,
    dialogBackgroundColor: darkBG2,
    canvasColor: darkBG2,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: darkBG2,
    ),
  );
}
