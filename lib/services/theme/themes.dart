import 'package:flutter/material.dart';

class Themes {
  static Color lightPrimary = Color(0xff3E4685);
  static Color darkPrimary = Color(0xffFE752F);

  static Color lightAccent = Color(0xff3E4685);
  static Color darkAccent = Color(0xffFE752F);

  static Color lightBG = Color(0xffF3F8FE);
  static Color darkBG = Colors.black;

  static Color lightBG2 = Color(0xffFFFFFF);
  static Color darkBG2 = Color(0xff1E1E1E);

  static Color buttonLight = Color(0xff3E4685);
  static Color buttonDark = Color(0xffFE752F);

  static Color appbarLight = Color(0xffFFFFFF);
  static Color appbarDark = Color(0xff1E1E1E);

  static Color shadowColorLight = Colors.black87;
  static Color shadowColorDark = Colors.white70;

  static var darkShadow = const <BoxShadow>[
    BoxShadow(
      color: Colors.white70,
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];
  static var lightShadow = const <BoxShadow>[
    BoxShadow(
      color: Colors.black87,
      spreadRadius: 5,
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ];

  static const MaterialColor primarySwatchLight = const MaterialColor(
    0xff3E4685,
    const <int, Color>{
      50: const Color(0xff3E4685),
      100: const Color(0xff3E4685),
      200: const Color(0xff3E4685),
      300: const Color(0xff3E4685),
      400: const Color(0xff3E4685),
      500: const Color(0xff3E4685),
      600: const Color(0xff3E4685),
      700: const Color(0xff3E4685),
      800: const Color(0xff3E4685),
      900: const Color(0xff3E4685),
    },
  );
  static const MaterialColor primarySwatchDark = const MaterialColor(
    0xffFE752F,
    const <int, Color>{
      50: const Color(0xffFE752F),
      100: const Color(0xffFE752F),
      200: const Color(0xffFE752F),
      300: const Color(0xffFE752F),
      400: const Color(0xffFE752F),
      500: const Color(0xffFE752F),
      600: const Color(0xffFE752F),
      700: const Color(0xffFE752F),
      800: const Color(0xffFE752F),
      900: const Color(0xffFE752F),
    },
  );

  static final light = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    primaryColorBrightness: Brightness.light,
    brightness: Brightness.light,
    // primaryColorLight: darkPrimary,
    // primaryColorDark: darkPrimary,
    accentColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 3,
      shadowColor: shadowColorLight,
      iconTheme: IconThemeData(color: Colors.grey),
      color: appbarLight,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.black, fontSize: 20.0),
        bodyText2: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
    ),
    bottomAppBarColor: lightBG2,
    bottomAppBarTheme: BottomAppBarTheme(color: lightBG2),
    cardColor: lightBG2,
    dialogBackgroundColor: lightBG2,
    canvasColor: lightBG2,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: lightBG2,
    ),
    buttonColor: buttonLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // type: BottomNavigationBarType.shifting,
      selectedItemColor: buttonLight,
      backgroundColor: lightBG2,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primarySwatchLight,
    ).copyWith(
      secondary: lightPrimary,
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    primaryColorBrightness: Brightness.dark,
    brightness: Brightness.dark,
    // primaryColorDark: darkPrimary,
    // primaryColorLight: darkPrimary,
    accentColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      elevation: 3,
      shadowColor: shadowColorDark,
      iconTheme: IconThemeData(color: Colors.grey),
      color: appbarDark,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 20.0),
        bodyText2: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
    ),
    bottomAppBarColor: darkBG2,
    bottomAppBarTheme: BottomAppBarTheme(color: darkBG2),
    cardColor: darkBG2,
    dialogBackgroundColor: darkBG2,
    canvasColor: darkBG2,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: darkBG2,
    ),
    buttonColor: buttonDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // type: BottomNavigationBarType.shifting,
      selectedItemColor: buttonDark,
      backgroundColor: darkBG2,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primarySwatchDark,
    ).copyWith(
      secondary: darkPrimary,
    ),
  );
}
