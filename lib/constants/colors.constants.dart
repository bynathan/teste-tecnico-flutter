import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFD01520);
  static const Color primary900 = Color(0xFFB8000C);
  static const Color primary800 = Color(0xFF9F1320);
  static const Color primary700 = Color(0xFF8E1122);
  static const Color primary600 = Color(0xFF7C0F24);
  static const Color primary500 = Color(0xFF6A0D26);
  static const Color primary400 = Color(0xFF590B29);
  static const Color primary300 = Color(0xFF48092B);
  static const Color primary200 = Color(0xFF37072D);
  static const Color primary100 = Color(0xFF26052F);
  static const Color primary50 = Color(0xFFF6B3BF);
  static const Color primary25 = Color(0xFFF9D1D3);

  static const Color secoundary = Color(0xFFE1E1E1);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray = Color(0xFFF7F8FA);
  static const Color text = Color(0xFF3D3D3D);
  static const Color error = Color(0xFFFF3B30);
  static const Color background = Color(0xFFEFF1F0);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      AppColors.primary400,
      AppColors.primary900,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
    tileMode: TileMode.decal,
  );
}