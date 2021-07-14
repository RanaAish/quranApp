import 'package:alquran_alkarim/enums/themes.dart';
import 'package:alquran_alkarim/enums/locales.dart';
import 'package:alquran_alkarim/imp/provider/settings.dart';
import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {

  ThemeData _themedata;
  SettingsProvider(this._themedata);
  gettheme()=>_themedata;
  settheme( ThemeData _theme){
    _themedata=_theme;
    notifyListeners();

  }
}
