import 'package:alquran_alkarim/imp/provider/quran.dart';
import 'package:alquran_wrapper/src/entities/edditon.entity.dart';
import 'package:alquran_wrapper/src/entities/aya.entity.dart';
import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier implements ImpQurnProvider {
  @override
  Future<void> copyAyaToClipboard(AyaEntity ayaEntity) {
    // TODO: implement copyAyaToClipboard
    throw UnimplementedError();
  }

  @override
  Future<AyaEntity> getNextAya() {
    // TODO: implement getNextAya
    throw UnimplementedError();
  }

  @override
  Future<AyaEntity> getPreviousAya() {
    // TODO: implement getPreviousAya
    throw UnimplementedError();
  }

  @override
  Future<AyaEntity> getRandomAya() {
    // TODO: implement getRandomAya
    throw UnimplementedError();
  }

  @override
  Future<void> pauseQuranAudio() {
    // TODO: implement pauseQuranAudio
    throw UnimplementedError();
  }

  @override
  Future<void> playQuranAudio() {
    // TODO: implement playQuranAudio
    throw UnimplementedError();
  }

  @override
  void setPrefaredAudioEdition(EditionEntity edittionEntity) {
    // TODO: implement setPrefaredAudioEdition
  }

  @override
  void setPrefaredQuranLanguage(localeEnum) {
    // TODO: implement setPrefaredQuranLanguage
  }

  @override
  Future<void> shareAya(AyaEntity aya) {
    // TODO: implement shareAya
    throw UnimplementedError();
  }
}
