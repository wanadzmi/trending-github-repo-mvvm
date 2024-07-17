import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static InputBorder? getDefaultInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: CustomColors.black,
      ),
    );
  }

  static InputBorder? getErrorInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: CustomColors.deepError),
    );
  }

  static ThemeData defaultTheme = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      color: CustomColors.primary,
    ),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: CustomColors.primary,
    ),
    primaryColor: CustomColors.primary,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: CustomColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      fillColor: Colors.white,
      border: getDefaultInputBorder(),
      enabledBorder: getDefaultInputBorder(),
      focusedBorder: getDefaultInputBorder(),
      focusedErrorBorder: getErrorInputBorder(),
      errorBorder: getErrorInputBorder(),
      errorMaxLines: 10,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          displayLarge: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 0,
          ),
          displayMedium: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 0,
          ),
          bodyLarge: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 0,
          ),
          bodyMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0,
          ),
          bodySmall: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            letterSpacing: 0,
          ),
          labelSmall: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            letterSpacing: 0,
          ),
        ),
  );
}
