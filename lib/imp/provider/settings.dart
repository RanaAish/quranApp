import 'package:alquran_alkarim/enums/locales.dart';
import 'package:alquran_alkarim/enums/themes.dart';

abstract class ImpSettingsProvider {
  void chnageTheme(ThemeEnum theme);
  void chnageLocale(LanguageEnum localeEnum);
  Future<bool> firstTimeOpenTheApp();
}
