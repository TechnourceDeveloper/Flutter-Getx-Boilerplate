import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/resources/resources.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: R.colors.kcCaptionLightGray),
      primaryColor: R.colors.kcPrimaryColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0, foregroundColor: Colors.white),
      brightness: Brightness.light,
      dividerColor: R.colors.kcPrimaryAccentColor.withOpacity(0.1),
      focusColor: R.colors.kcPrimaryAccentColor,
      hintColor: R.colors.kcDefaultText,
      colorScheme: ColorScheme.light(
          primary: R.colors.kcPrimaryColor, secondary: R.colors.kcPrimaryColor),
      textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme));
}
