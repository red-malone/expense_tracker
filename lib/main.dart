import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense_tracker.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
);

var kdarkmodeColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.dark,
);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: kdarkmodeColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(
            horizontal:10,
            vertical:4,
            ),
          elevation: 2,
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(
            horizontal:10,
            vertical:4,
            ),
          elevation: 2,
        ),
      ),
      home: const Expenses(),
    ),
  );
}
