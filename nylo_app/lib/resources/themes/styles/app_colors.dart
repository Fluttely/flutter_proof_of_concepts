import 'package:flutter/material.dart';

class _Colors {
  static const Color transparent = Color(0x00FFFFFF);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color halloweenOrange = Color(0xffD96F32);

  // TODO(KEVIN): SEARCH REAL COLORNAME
  static Color grey = const Color(0xff495161);
}

class AppColors {
  static const Color secondary = Color(0xFF627aba);
  static const Color transparent = _Colors.transparent;
  static const Color white = _Colors.white;
  static const Color black = _Colors.black;
  static Color grey = Colors.grey.shade700;
  static Color opacityWhite = _Colors.white.withOpacity(0.6);
  static const Color orange = _Colors.halloweenOrange;
  static const MaterialColor deepOrange = Colors.deepOrange;
  static Color textFieldFillColor = opacityWhite;
  static Color profileNameContainerBackground = _Colors.grey.withOpacity(0.9);
}
