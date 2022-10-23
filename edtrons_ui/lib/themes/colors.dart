import 'package:flutter/material.dart';

class AppColors {
  // Blue Colors
  static const Color bluePrimary = Color(0xFF006BA6);
  static const Color blueDark = Color(0xFF0C4E79);
  static const Color blueLight = Color(0xFF40A9ED);

  // Yellow Colors
  static const Color yellowSecondary = Color(0xFFFFC82B);
  static const Color yellowDart = Color(0xFFEBAE00);
  static const Color yellowLight = Color(0xFFFFE599);

  // Pink Colors
  static const Color pinkSecondary = Color(0xFFEC008C);
  static const Color pinkDart = Color(0xFFAD0067);
  static const Color pinkLight = Color(0xFFFF5CBD);

  // Aqua Colors
  static const Color aquaSecondary = Color(0xFF51C5DF);
  static const Color aquaDart = Color(0xFF26B0CF);
  static const Color aquaLight = Color(0xFFB1E5F1);

  // gray
  static const Color gray8f0 = Color(0xFFE2E8F0);
  static const Color grayAFC = Color(0xFFF7FAFC);

  static const Color shimmer = Color(0xFFE9ECEF);
  static const Color shimmerHiglight = Color(0xFFf5f6f7);

  var dfd = Colors.red;

  static const MaterialColor white = MaterialColor(
    _whitePrimaryValue,
    <int, Color>{
      50: Color(0x0AFFFFFF),
      100: Color(0x0FFFFFFF),
      200: Color(0x14FFFFFF),
      300: Color(0x29FFFFFF),
      400: Color(0x3DFFFFFF),
      500: Color(0x5CFFFFFF),
      600: Color(0x7AFFFFFF),
      700: Color(0xA3FFFFFF),
      800: Color(0xCCFFFFFF),
      900: Color(0xEBFFFFFF),
    },
  );
  static const int _whitePrimaryValue = 0xFFFFFFFF;

  static const MaterialColor black = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      1: Color(0x03000000),
      2: Color(0x05000000),
      3: Color(0x08000000),
      4: Color(0x0A000000),
      5: Color(0x0D000000),
      6: Color(0x0F000000),
      7: Color(0x12000000),
      8: Color(0x14000000),
      10: Color(0x1A000000),
      20: Color(0x33000000),
      25: Color(0x40000000),
      50: Color(0x0A000000),
      100: Color(0x0F000000),
      200: Color(0x14000000),
      300: Color(0x29000000),
      400: Color(0x3D000000),
      500: Color(0x5C000000),
      600: Color(0x7A000000),
      700: Color(0xA3000000),
      800: Color(0xCC000000),
      900: Color(0xEB000000),
    },
  );
  static const int _blackPrimaryValue = 0xFF000000;

  static const MaterialColor gray = MaterialColor(
    _grayPrimaryValue,
    <int, Color>{
      10: Color(0xFFFAFAFA),
      50: Color(0xFFF7FAFC),
      100: Color(0xFFEDF2F7),
      200: Color(0xFFE2E8F0),
      300: Color(0xFFCBD5E0),
      400: Color(0xFFA0AEC0),
      500: Color(_grayPrimaryValue),
      600: Color(0xFF4A5568),
      700: Color(0xFF2D3748),
      800: Color(0xFF1A202C),
      900: Color(0xFF171923),
    },
  );
  static const int _grayPrimaryValue = 0xFF718096;

  static const MaterialColor red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF5F5),
      100: Color(0xFFFED7D7),
      200: Color(0xFFFEB2B2),
      300: Color(0xFFFC8181),
      400: Color(0xFFF56565),
      500: Color(_redPrimaryValue),
      600: Color(0xFFC53030),
      700: Color(0xFF9B2C2C),
      800: Color(0xFF822727),
      900: Color(0xFF63171B),
    },
  );
  static const int _redPrimaryValue = 0xFFE53E3E;

  static const MaterialColor orange = MaterialColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFAF0),
      100: Color(0xFFFEEBCB),
      200: Color(0xFFFBD38D),
      300: Color(0xFFF6AD55),
      400: Color(0xFFED8936),
      500: Color(_orangePrimaryValue),
      600: Color(0xFFDD6B20),
      700: Color(0xFFC05621),
      800: Color(0xFF7B341E),
      900: Color(0xFF652B19),
    },
  );
  static const int _orangePrimaryValue = 0xFFDD6B20;

  static const MaterialColor yellow = MaterialColor(
    _yellowPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFFF0),
      100: Color(0xFFFEFCBF),
      200: Color(0xFFFAF089),
      300: Color(0xFFF6E05E),
      400: Color(0xFFECC94B),
      500: Color(_yellowPrimaryValue),
      600: Color(0xFFB7791F),
      700: Color(0xFF975A16),
      800: Color(0xFF744210),
      900: Color(0xFF5F370E),
    },
  );
  static const int _yellowPrimaryValue = 0xFFD69E2E;

  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      50: Color(0xFFF0FFF4),
      100: Color(0xFFC6F6D5),
      200: Color(0xFF9AE6B4),
      300: Color(0xFF68D391),
      400: Color(0xFF48BB78),
      500: Color(_greenPrimaryValue),
      600: Color(0xFF25855A),
      700: Color(0xFF276749),
      800: Color(0xFF22543D),
      900: Color(0xFF1C4532),
    },
  );
  static const int _greenPrimaryValue = 0xFF38A169;

  static const MaterialColor greenDark = MaterialColor(
    _greenDarkPrimaryValue,
    <int, Color>{
      50: Color(0xFFF0FFF4),
      100: Color(0xFFC6F6D5),
      200: Color(0x4D247881),
      500: Color(_greenDarkPrimaryValue),
      700: Color(0xFF276749),
      800: Color(0xFF22543D),
      900: Color(0xFF1C4532),
    },
  );
  static const int _greenDarkPrimaryValue = 0xFF247881;

  static const MaterialColor teal = MaterialColor(
    _tealPrimaryValue,
    <int, Color>{
      50: Color(0xFFE6FFFA),
      100: Color(0xFFB2F5EA),
      200: Color(0xFF81E6D9),
      300: Color(0xFF4FD1C5),
      400: Color(0xFF38B2AC),
      500: Color(_tealPrimaryValue),
      600: Color(0xFF2C7A7B),
      700: Color(0xFF285E61),
      800: Color(0xFF234E52),
      900: Color(0xFF1D4044),
    },
  );
  static const int _tealPrimaryValue = 0xFF319795;

  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFEBF8FF),
      100: Color(0xFFBEE3F8),
      200: Color(0xFF90CDF4),
      300: Color(0xFF63B3ED),
      400: Color(0xFF4299E1),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF2B6CB0),
      700: Color(0xFF2C5282),
      800: Color(0xFF2A4365),
      900: Color(0xFF1A365D),
    },
  );
  static const int _bluePrimaryValue = 0xFF3182CE;

  static const MaterialColor cyan = MaterialColor(
    _cyanPrimaryValue,
    <int, Color>{
      50: Color(0xFFEDFDFD),
      100: Color(0xFFC4F1F9),
      200: Color(0xFF9DECF9),
      300: Color(0xFF76E4F7),
      400: Color(0xFF0BC5EA),
      500: Color(_cyanPrimaryValue),
      600: Color(0xFF00A3C4),
      700: Color(0xFF0987A0),
      800: Color(0xFF086F83),
      900: Color(0xFF065666),
    },
  );
  static const int _cyanPrimaryValue = 0xFF00B5D8;

  static const MaterialColor purple = MaterialColor(
    _purplePrimaryValue,
    <int, Color>{
      50: Color(0xFFFAF5FF),
      100: Color(0xFFE9D8FD),
      200: Color(0xFFD6BCFA),
      300: Color(0xFFB794F4),
      400: Color(0xFF9F7AEA),
      500: Color(_purplePrimaryValue),
      600: Color(0xFF6B46C1),
      700: Color(0xFF553C9A),
      800: Color(0xFF44337A),
      900: Color(0xFF322659),
    },
  );
  static const int _purplePrimaryValue = 0xFF805AD5;

  static const MaterialColor pink = MaterialColor(
    _pinkPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF5F7),
      100: Color(0xFFFED7E2),
      200: Color(0xFFFBB6CE),
      300: Color(0xFFF687B3),
      400: Color(0xFFED64A6),
      500: Color(_pinkPrimaryValue),
      600: Color(0xFFB83280),
      700: Color(0xFF97266D),
      800: Color(0xFF702459),
      900: Color(0xFF521B41),
    },
  );
  static const int _pinkPrimaryValue = 0xFFD53F8C;
}
