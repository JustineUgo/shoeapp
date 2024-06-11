import 'package:flutter/material.dart';
import 'package:shoesly/theme/color.dart';

class ShoeslyTheme {
  static final ThemeData themeData = ThemeData(
    fontFamily: 'urbanist',
    brightness: Brightness.light,
    primaryColor: ShoeslyColors.primaryNeutral.shade500,
    scaffoldBackgroundColor: ShoeslyColors.primaryNeutral.shade50,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 13, horizontal: 24)),
        foregroundColor: MaterialStateProperty.all(ShoeslyColors.primaryNeutral),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return ShoeslyColors.primaryNeutral.shade100;
          }
          return ShoeslyColors.primaryNeutral.shade50;
        }),
        shape: MaterialStateProperty.all( RoundedRectangleBorder(
          side: BorderSide(color: ShoeslyColors.primaryNeutral.shade200),
          borderRadius: const BorderRadius.all(Radius.circular(100)))),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 13, horizontal: 24)),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return ShoeslyColors.primaryNeutral.shade200;
          }
          return ShoeslyColors.primaryNeutral;
        }),
        foregroundColor: MaterialStateProperty.all(ShoeslyColors.primaryNeutral.shade50),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100)))),
      ),
    ),
  );
}
