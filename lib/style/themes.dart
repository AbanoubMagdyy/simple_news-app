import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_news_app/style/color.dart';

ThemeData darkTheme = ThemeData(
  textTheme:  TextTheme(
    bodyMedium: TextStyle(
      color: defaultColor,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
primaryColor: Colors.black,
  primarySwatch: Colors.lightGreen,
  appBarTheme:  AppBarTheme(
      color: Colors.black,
      elevation: 0,
      titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: defaultColor,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light)),
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:  AppBarTheme(
      color: Colors.white,
      elevation: 0,
      titleTextStyle: const TextStyle(
          color: Colors.black54, fontSize: 25, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: defaultColor,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
      ),
  ),
  primaryColor: Colors.white,
  primarySwatch: Colors.lightGreen,
  textTheme:  TextTheme(
    bodyMedium: TextStyle(
      color: defaultColor,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
);
