import 'package:flutter/material.dart';
class MyTheme{
  static Color blackColor = Color(0xff242424);
  static Color primaryLightColor =Color(0xffB7935F);
  static Color primaryDarkColor =Color(0xff141A2E);
  static Color whiteColor =Color(0xffF8F8F8);
  static Color yellowColor =Color(0xffFACC1D);


  static ThemeData lightMode =ThemeData(
    primaryColor: primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      centerTitle: true,
    ),
      textTheme: TextTheme(
      titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
        fontSize: 30,
        color: blackColor
  ),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: blackColor
      ),
       titleSmall: TextStyle(
           fontWeight: FontWeight.w400,
           fontSize: 25,
           color: blackColor
       ),
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
    ),
  );
  static ThemeData darkMode =ThemeData(


    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
      centerTitle: true,
    ),
      textTheme: TextTheme(
      titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
        fontSize: 30,
        color: whiteColor
  ),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: whiteColor
      ),
       titleSmall: TextStyle(
           fontWeight: FontWeight.w400,
           fontSize: 25,
           color: whiteColor
       ),
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: yellowColor,
    ),
  );
}