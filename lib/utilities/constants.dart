import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polynomial/utilities/utilities.dart';

class Constants {
  // Constructor
  Constants.empty();

  /*
  TEXT STYLES
  */

  static const TextStyle boldHeadlineStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static const TextStyle boldSubheadlineStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle blackBoldNormal = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle kHeadlineStyle = TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kPositiveButtonStyle = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  /*
  BORDERS
  */
  static const InputBorder blackInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  );

  /*
  SIZING
  */
  static const double padding = 20;
  static const double avatarRadius = 45;

  /*
  DECORATIONS AND BORDERS
  */

  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Palette.kTextColor),
    gapPadding: 10,
  );

  static RoundedRectangleBorder curvedRectBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  /*
  THEME
  */
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    platform: TargetPlatform.iOS,
    fontFamily: 'Lato',
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  static TextTheme textTheme = GoogleFonts.latoTextTheme();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );

  /*
  FORM ERRORS
  */
  static const String kIdNumberNullError =
      'Please enter your Identification Number';
  static const String kPassNullError = 'Please enter your password';
  static const String kPolyNullError = 'Please enter your polynomial';
  static const String kShortPassError = 'Password is too short';
}
