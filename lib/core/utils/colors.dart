import 'package:flutter/material.dart';

/// All name colors according to https://chir.ag/projects/name-that-color
class AppColors {
  const AppColors();

  //! Contracts Application only

  static const white = Colors.white;

  static const enabyDark = Color(0xD2720C33);
  static const enaby = Color(0x78720C33);
  static const enabyLight = Color(0x66720C33);
  static const redLight = Color(0xFFF5B7B7);
  static const redDark = Color(0xFFFF0000);
  static const greenLight = Color(0xFFE0FBD7);
  static const greenDark = Color(0xFF51A931);
  static const kashmeer = Color(0xFFB69F9F);

  static const _white = Colors.white;
  static const whiteGrey = Color(0xFFE6E6E6);
  static const _blackGrey = Color(0xff323232);
  static const _gold = Color(0xffEBC06B);
  static const _blackShadeGrey = Color(0xFF404040);

  static const _robRoy = Color(0xffFE5917);
  static const _mineShaft = Color(0xff2B2B2B);
  static const _doveGray = Color(0xff6A6A6A);
  static const _rollingStone = Color(0xff707B81); //
  static const _athensGray = Color(0xffF7F7F9);
  static const _alabaste = Color(0xffFAFAFA);

  /// text colors
  static const titleLarge = _mineShaft;
  static const titleMedium = _mineShaft;
  static const titleSmall = _mineShaft;
  static const bodySmall = _rollingStone;
  static const bodyMedium = _doveGray;
  static const labelSmall = _mineShaft;
  static const displayMedium = _gold;

  /// material color
  static MaterialColor getLightMaterialColor() {
    return MaterialColor(const Color(0xffEBC06B).value, const <int, Color>{
      50: _robRoy,
      100: _robRoy,
      200: _robRoy,
      300: _robRoy,
      400: _robRoy,
      500: _robRoy,
      600: _robRoy,
      700: _robRoy,
      800: _robRoy,
      900: _robRoy,
    });
  }

  /// font colors
  static const fontBlack = _mineShaft;
  static const fontWhite = _white;

  /// light app theme ...
  static const colorSchemeSeed = _athensGray;
  static const primary = _robRoy;
  static const scaffoldBackground = _athensGray;

  /// onBoarding Screen
  static const onBoardingBackColor = _white;
  static const onBoardingShadeBackColor = _blackShadeGrey;
  static const activeRadioColor = _blackGrey;
  static const gold = _gold;

  static const whiteGreyButtonBackground = whiteGrey;

  /// login screen

  static const hintColor = _doveGray;
  static const fillColor = whiteGrey;
  static const iconColor = _rollingStone;
  static const textFieldTitleColor = _mineShaft;

  /// layout
  static const inActiveColor = _rollingStone;
  static const activeColor = _robRoy;

  /// home
  static const searchHintColor = _doveGray;

  /// settings
  static const settingItemBackground = _alabaste;
  static const settingIcon = _blackGrey;
}
