import 'package:flutter/material.dart';

import 'package:spendox/widgets/expenses/start_screen.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 0, 0),
  primary: const Color.fromARGB(255, 0, 0, 0),
  secondary: const Color.fromARGB(255, 255, 255, 255),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,

        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),

        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onPrimary,
          )
        ),

        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
          ),
        )
      ),
      home: StartScreen(),
    )
  );
}
