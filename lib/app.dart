import 'package:alquran_alkarim/pages/custompaint.dart';
import 'package:alquran_alkarim/pages/readingsurah.dart';
import 'package:alquran_alkarim/providers/bookmark.dart';
import 'package:flutter/material.dart';
import'package:alquran_alkarim/pages/splash.page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alquran_alkarim/pages/Surahdetails.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'config/app.config.dart';
import 'package:alquran_alkarim/pages/sphah.dart';
import'package:alquran_alkarim/providers/setting.dart';
import 'package:alquran_alkarim/pages/splachscreen.dart';
import 'package:alquran_alkarim/providers/sheikh.dart';
import 'package:alquran_alkarim/pages/praytimes.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:
      [
        ChangeNotifierProvider <bookmark> (create:(context)=> bookmark(),),
        ChangeNotifierProvider <SettingsProvider> (create: (context)=> SettingsProvider(AppThemes.light),),
        ChangeNotifierProvider <sheikh> (create: (context)=> sheikh(),),
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RenderErrorBox.backgroundColor = Colors.transparent;
    RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
    final theme= Provider.of<SettingsProvider>(context);
    //  TODO : USER MaterialApp.router() with auto_route package
    //  TODO : use device_previw in devleopment only
    //  TODO : wrap material with SettingProviderCounsmer
    return MaterialApp(
        initialRoute:splachscreen.id,
        routes: {
          splachscreen.id:(context)=> splachscreen(),
          sphah.id:(context)=>sphah(),
          SplashPage.id: (context) => SplashPage(),
          Surahdetails .id:(context)=> Surahdetails(),
          CustomDemo.id:(context)=>CustomDemo(),
          readindsurah.id:(context)=>readindsurah(),
          PrayTimes.id:(context)=>PrayTimes(),

        },
        title: AppConfig.APP_TITLE,
        debugShowCheckedModeBanner: AppConfig.SHOW_DEBUG_BANNER,
        theme: theme.gettheme(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home:splachscreen()
    );
  }
}