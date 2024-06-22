import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalTheme {
  static ThemeData lighttheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      secondaryHeaderColor: Colors.teal,
      appBarTheme: AppBarTheme(
        color: Colors.amber,
      ),
      colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          surface: Color(0xff9929AB),
          secondary: Colors.white,
          onInverseSurface: Color(0xff6FAB77),
          onTertiary: Color(0xff3394DE),
          onTertiaryContainer: Color(0xffF09F8B)),
      primaryColor: Colors.grey,
      textTheme: const TextTheme(

          bodyMedium: TextStyle(
            fontSize: 25,
          ),
          bodyLarge: TextStyle(
              fontSize: 30,fontWeight: FontWeight.w500
          ),
          titleLarge: TextStyle(
              fontWeight: FontWeight.bold, color: CupertinoColors.black),
          titleMedium: TextStyle(
              fontWeight: FontWeight.w500, color: CupertinoColors.black)));
  static ThemeData darktheme = ThemeData(
      scaffoldBackgroundColor: Colors.black38,
      brightness: Brightness.dark,
      primaryColor: Colors.teal,
      secondaryHeaderColor: Colors.grey,
      colorScheme: const ColorScheme.light(
          brightness: Brightness.dark,
          secondary: Colors.black,
          surface: Color(0xffED9C1C),
          onInverseSurface: Color(0xff275E8C),
          onTertiary: Color(0xffCB285B),
          onTertiaryContainer: Color(0xff7C7144)),
      appBarTheme: AppBarTheme(
        color: Colors.lightGreen.shade400,
      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: CupertinoColors.white,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            color: CupertinoColors.white,
          )));
}