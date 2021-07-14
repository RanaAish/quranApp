import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static ThemeData currentTheme = light;
  static ThemeData light = ThemeData.light().copyWith(


    /*
      primaryColor: kPrimaryColor,
    secondaryHeaderColor: kSecondColor,
    accentColor: kAccentColor,
     textTheme: ThemeData.light().textTheme.copyWith(
        headline6: GoogleFonts.amiri(textStyle: AppTextStyles.kAmiriFontStyle)),
*/
  );
}
