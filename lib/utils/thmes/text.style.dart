import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';
import 'package:alquran_alkarim/providers/setting.dart';

abstract class AppTextStyles {



  static const Aya = TextStyle(
      fontFamily: "Amiri",
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color:CustomColors.kTextMainColor);

  static const AyaEnglish = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: CustomColors.kTextMainColor);

  static const SurahDetials = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: CustomColors.kSecondaryGreyColor);

  static const SurahNumber = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: CustomColors.kTextMainColor);

  static const tabBarHeader = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: CustomColors.kMainColor);
  static const WelcomText = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: CustomColors.kSecondaryGreyColor);
  static const UserName = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: CustomColors.kTextMainColor);
  static const LastReadTextStyle = TextTheme(
    subtitle2: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.white),
    headline5: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.white),
    bodyText1: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white),
  );

  static const appTitle = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: CustomColors.kMainColor);

  static const appsubtitle = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w200,
      fontSize: 17,
      color: CustomColors.ktextsecondarycolor);

  static const buttuntitile = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: CustomColors.kwhite);

  static const AyainArabic = TextStyle(
      fontFamily: "Amiri",
      fontWeight: FontWeight.w700,
      fontSize: 17,

      color: CustomColors.kTextMainColor);
  static const AyainArabicreading = TextStyle(
      fontFamily: "Amiri",
      fontWeight: FontWeight.w700,
      fontSize: 30,
      //17
      color: CustomColors.kTextMainColor);
  static const SurahArabicName = TextStyle(
      fontFamily: "Amiri",
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: CustomColors.kSecondaryColor);

  static const AyainEnglish = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: CustomColors.kTextMainColor);

  static const SurahEnglishName = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: CustomColors.kTextMainColor);

  static const NumberofAya = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 11,
      color: CustomColors.kOfWhite);

  static const appBarEnglishText = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: CustomColors.kMainColor);

  static const beginofaya = TextTheme(
    subtitle1: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        fontSize: 26,
        color: Colors.white),
    subtitle2: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white),
    bodyText1: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.white),
  );
  //
  static const Ayadark = TextStyle(
      fontFamily: "Amiri",
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color:CustomColors.kOfWhite);

  static const AyaEnglishdark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: CustomColors.kOfWhite);

  static const SurahDetialsdark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: CustomColors.kOfWhite);

  static const SurahNumberdark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: CustomColors.kOfWhite);

  static const tabBarHeaderdark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: CustomColors.kOfWhite);
  static const WelcomTextdark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: CustomColors.kOfWhite);
  static const UserNamedark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: CustomColors.kOfWhite);


  static const appTitledark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: CustomColors.kOfWhite);

  static const appsubtitledark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w200,
      fontSize: 17,
      color: CustomColors.kOfWhite);


  static const AyainArabicdark = TextStyle(
      fontFamily: "Amiri",
      fontWeight: FontWeight.w700,
      fontSize: 17,

      color: CustomColors.kOfWhite);
  static const AyainArabicreadingdark = TextStyle(
      fontFamily: "Amiri",
      fontWeight: FontWeight.w700,
      fontSize: 30,
      //17
      color: CustomColors.kOfWhite);
  static const SurahArabicNamedark = TextStyle(
      fontFamily: "Amiri",
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: CustomColors.kOfWhite);

  static const AyainEnglishdark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: CustomColors.kOfWhite);

  static const SurahEnglishNamedark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: CustomColors.kOfWhite);



  static const appBarEnglishTextdark = TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: CustomColors.kOfWhite);


}
