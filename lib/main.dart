import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expense_tracker.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  );

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        cardTheme: const CardTheme().copyWith(
          elevation: 2,
        ),
      ),
      home: const Expenses(),
    ),
  );
}
