import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle displayLarge([Color? color]) => const TextStyle(
    fontSize: 52,
    fontWeight: FontWeight.bold,
  ).apply(color: color ?? Colors.black);
  static TextStyle displayMedium([Color? color]) => const TextStyle(
    fontFamily: 'Raleway',
    fontSize: 50,
    fontWeight: FontWeight.bold,
  ).apply(color: color ?? Colors.black);

  // 🖋️ Headings
  static TextStyle headingLarge([Color? color]) => const TextStyle(
    fontFamily: 'Raleway_bold',
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ).apply(color: color ?? Colors.black);
  static TextStyle headingMedium([Color? color]) => const TextStyle(
    fontFamily: 'Raleway',
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ).apply(color: color ?? Colors.black);

  static TextStyle headingSmall([Color? color]) => const TextStyle(
    fontFamily: 'Raleway',
    fontSize: 21,
    fontWeight: FontWeight.bold,
  ).apply(color: color ?? Colors.black);
  // 🖋️ Body / Paragraph text
  static TextStyle bodyLargeLight([Color? color]) => const TextStyle(
    fontFamily: 'Raleway',
    fontSize: 22,
    fontWeight: FontWeight.w300,
  ).apply(color: color ?? Colors.black);
  static TextStyle bodyMediumLight([Color? color]) => const TextStyle(
    fontFamily: 'Raleway',
    fontSize: 19,
    fontWeight: FontWeight.w300,
  ).apply(color: color ?? Colors.white);
  static TextStyle bodySmallLight([Color? color]) => const TextStyle(
    fontFamily: 'Raleway_bold',
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ).apply(color: color ?? Colors.black);
  static TextStyle bodyMediumBold([Color? color]) => const TextStyle(
    fontFamily: "Raleway_bold",
    fontSize: 21,
    fontWeight: FontWeight.bold,
  ).apply(color: color ?? Colors.white);

   static TextStyle bodySmallBold([Color? color]) => const TextStyle(
    fontFamily: "Raleway_bold",
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ).apply(color: color ?? Colors.white);
}
