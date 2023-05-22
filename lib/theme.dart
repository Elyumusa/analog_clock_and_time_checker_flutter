import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

// Our light/Primary Theme
ThemeData themeData(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    appBarTheme: appBarTheme,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
        secondary: kSecondaryLightColor, background: Colors.white
        // on light theme surface = Colors.white by default
        ),
    iconTheme: IconThemeData(color: kBodyTextColorLight),
    // accentIconTheme: IconThemeData(color: kAccentIconLightColor),
    primaryIconTheme: IconThemeData(color: kPrimaryIconLightColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyLarge: TextStyle(color: kBodyTextColorLight),
      bodyMedium: TextStyle(color: kBodyTextColorLight),
      headlineMedium: TextStyle(color: kTitleTextLightColor, fontSize: 32),
      displayLarge: TextStyle(color: kTitleTextLightColor, fontSize: 80),
    ),
  );
}

// Dark Them
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Color(0xFF0D0C0E),
    appBarTheme: appBarTheme,
    colorScheme: ColorScheme.light(
      secondary: kSecondaryDarkColor,
      surface: kSurfaceDarkColor,
      background: kBackgroundDarkColor,
    ),
    iconTheme: IconThemeData(color: kBodyTextColorDark),
    primaryIconTheme: IconThemeData(color: kPrimaryIconDarkColor),
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodyLarge: TextStyle(color: kBodyTextColorDark),
      bodyMedium: TextStyle(color: kBodyTextColorDark),
      headlineMedium: TextStyle(color: kTitleTextDarkColor, fontSize: 32),
      displayLarge: TextStyle(color: kTitleTextDarkColor, fontSize: 80),
    ),
  );
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
