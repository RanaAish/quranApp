import 'dart:io';
import 'package:alquran_alkarim/app.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'models/quranresponse.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Directory document =await getApplicationDocumentsDirectory();
  Hive.init( document.path);
  Hive.registerAdapter(SurahAdapter(),);
  Hive.registerAdapter(ArAyahAdapter());
  Hive.registerAdapter(EnAyhaAdapter());
  await Hive.openBox('arabicaya');
  await Hive.openBox('englishaya');
  await _askForPermissons();
  runApp(EasyLocalization(
      saveLocale: true,
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'DZ')],
      path: 'assets/langs', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'),

      child:  myapp()));
}

Future<void> _askForPermissons() {
  // TODO :: ask the user for
  // * location permisson
}