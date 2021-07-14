import 'package:alquran_alkarim/enums/locales.dart';
import 'package:alquran_wrapper/alquran.dart';

abstract class ImpQurnProvider {
  void setPrefaredAudioEdition(EditionEntity edittionEntity);
  void setPrefaredQuranLanguage(LanguageEnum localeEnum);
  Future<AyaEntity> getNextAya();
  Future<AyaEntity> getPreviousAya();
  Future<AyaEntity> getRandomAya();
  Future<void> playQuranAudio();
  Future<void> pauseQuranAudio();
  Future<void> copyAyaToClipboard(AyaEntity ayaEntity);
  Future<void> shareAya(AyaEntity aya);
}
