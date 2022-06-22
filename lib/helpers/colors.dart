import 'package:flutter/material.dart';

class CustomColors {
  static const Color greyColor = Color(0xFFC5CECF);
  static const Color whiteColor = Color(0xFFFCFFFF);
  static const Color blueGreyColor = Color(0xFF93BEC3);
  static const Color blackColor = Color(0xFF000000);
  static const Color blackColor54 = Color(0x89000000);
}

class ThemeColors {
  ThemeColors._();

  static const buildthemeColor = 0xFF75FBFD;

  static const MaterialColor themeColor = MaterialColor(
    buildthemeColor,
    <int, Color>{
      50: Color(0xFFe0e0e0),
      100: Color(0xFFb3b3b3),
      200: Color(0xFF808080),
      300: Color(0xFF4d4d4d),
      400: Color(0xFF262626),
      500: Color(0xFF4AE4E6),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
}
