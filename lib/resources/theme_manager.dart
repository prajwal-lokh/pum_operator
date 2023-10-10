
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pum_operator/resources/color_manager.dart';
import 'package:pum_operator/resources/font_manager.dart';

///login
class LoginTextStyles {
  static TextStyle customTextStyle = TextStyle(
    fontFamily: FontConstants.fontFamily1,
    fontSize: FontSize.s15_25,
    fontWeight: FontWeightManager.medium,
    color: ColorManager.faintgrey,
  );
}

///operator order
class ThemeManager {
  static TextStyle customTextStyle({required Color color}) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2,
      color: color,
      fontWeight: FontWeightManager.medium,
      fontSize: FontSize.s16,
    );
  }
}


///changing random
class RandomConstant {
  static TextStyle customTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

class HomeOperatorConstant {
  static TextStyle customTextStyle(BuildContext context, Color textColor) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2,
      fontWeight: FontWeightManager.bold,
      fontSize: MediaQuery.of(context).size.width / 40,
      color: textColor,
    );
  }
}

class OperatorConstant {
  static TextStyle customTextStyle(BuildContext context, Color textColor) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2, fontSize: MediaQuery.of(context).size.width / 40,
      color: textColor,
    );
  }
}

///popup
class PopupConstant {
  static TextStyle customTextStyle(BuildContext context, Color textColor) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2,
      fontWeight: FontWeightManager.regular,
      fontSize: MediaQuery.of(context).size.width / 50,
      color: textColor,
    );
  }
}

class RandomColor {
  static TextStyle customTextStyle({required Color color}) {
    return TextStyle(
      fontFamily: FontConstants.fontFamily2,
      color: color,
      fontWeight: FontWeightManager.bold,
      fontSize: FontSize.s15,
    );
  }
}