import 'package:flutter/material.dart';

class DefaultTheme{
  static const Color primary = Colors.green;
  static final Color primaryHover = Colors.green.shade600;

  static final ThemeData defaultTheme = ThemeData.light().copyWith(
        primaryColor: Colors.greenAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: primary
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: primary
          )
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: Colors.white
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: primary
        ),        
      );
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
        primaryColor: Colors.greenAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: primary
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: primary
          )
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: Colors.white
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: primary
        )
      );
}