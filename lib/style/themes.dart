import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_news_app/style/color.dart';

ThemeData darkTheme = ThemeData(
  textTheme:  TextTheme(
    bodyMedium: TextStyle(
      color: defaultColor,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
primaryColor: Colors.black,
  appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light)),
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black54, fontSize: 25, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark)),
  primaryColor: Colors.white,
  textTheme:  TextTheme(
    bodyMedium: TextStyle(
      color: defaultColor,
      fontWeight: FontWeight.bold,
    ),
  ),
);
