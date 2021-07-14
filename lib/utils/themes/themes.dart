import 'package:flutter/material.dart';
import 'package:alquran_alkarim/utils/themes/colors.dart';

abstract class AppThemes {
  static ThemeData currentTheme = light;

  static ThemeData light = ThemeData(
    //   todo : set theme values
      primaryColor: CustomColors.kMainColor,
      brightness:Brightness.light,
      textTheme: TextTheme(bodyText2: TextStyle(color:CustomColors.kTextMainColor)),
      fontFamily: "Poppins",
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: CustomColors.kSecondaryGreyColor)),
      iconTheme: IconThemeData(color: CustomColors.kSecondaryGreyColor));
  static ThemeData dark = ThemeData(
    primaryColor: CustomColors.kOfWhite,
    accentColor:  CustomColors.kOfWhite,
    brightness:Brightness.dark,
      appBarTheme: AppBarTheme(
          color: Colors.black45,
          iconTheme: IconThemeData(color: CustomColors.kOfWhite)),
      iconTheme: IconThemeData(color: CustomColors.kOfWhite),
    textTheme: TextTheme(bodyText2: TextStyle(color:CustomColors.kwhite)),
  );
}