import 'package:flutter/material.dart';

import 'package:spendox/widgets/expenses/start_screen.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 51, 49, 129),
  primary: const Color.fromARGB(255, 0, 0, 0),
  secondary: const Color.fromARGB(255, 255, 255, 255),
  errorContainer: const Color.fromARGB(255, 219, 113, 113),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
  primary: const Color.fromARGB(255, 0, 0, 0),
  secondary: const Color.fromARGB(255, 10, 37, 53),
  errorContainer: const Color.fromARGB(255, 219, 113, 113),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.inversePrimary,
          foregroundColor: kDarkColorScheme.inverseSurface,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          )
        ),

      ),
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
          titleMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
          ),
        )
      ),
      home: StartScreen(),
      // themeMode: ThemeMode.system,
    )
  );
}
