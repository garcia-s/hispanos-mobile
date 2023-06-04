import 'package:flutter/material.dart';

final ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color.fromRGBO(114, 14, 14, 1),
  textTheme: const TextTheme(
    labelSmall: TextStyle(
      color: Colors.white,
      backgroundColor: Colors.transparent,
      decorationThickness: 0,
      fontSize: 9,
      wordSpacing: 10,
      decorationColor: Colors.transparent,
      height: 0,
    ),
  ),
);
