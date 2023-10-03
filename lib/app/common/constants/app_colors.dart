import 'package:flutter/material.dart';

class AppColors {
  //Color App
  static const Color primaryColor = Color(0xFF0066FF);
  static const Color secondColor = Color(0xFFCCE0FF);
  static Color? primaryColorDark = Colors.indigo[800];
  static const Color accentColor = Color(0xFFCCE0FF);
  static Color? accentColorDark = Colors.grey[800];

  static Color? errorColor = Colors.red[900];

  static const MaterialColor materialSwatchColor = MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFFE6F0FF),
      100: Color(0xFFCCE0FF),
      200: Color(0xFFB3D1FF),
      300: Color(0xFF99C2FF),
      400: Color(0xFF80B3FF),
      500: Color(0xFF66A3FF),
      600: Color(0xFF4D94FF),
      700: Color(0xFF3385FF),
      800: Color(0xFF1A75FF),
      900: Color(0xFF0066FF),
    },
  );
}
