import 'dart:core';

import 'package:alquran_alkarim/widgets/appbuttun.dart';
import 'package:alquran_alkarim/widgets/backgound_splach.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:alquran_alkarim/widgets/appsubtitile.dart';
import 'package:alquran_alkarim/widgets/apptitile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:core' as hack;

// TODO :: splash page
class SplashPage extends StatelessWidget {
  static hack.String id = "SplashPage";
  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context).locale=Locale('en', 'US');

    return
      Scaffold(
          backgroundColor: Colors.white,
          body:ResponsiveBuilder(
              builder: (context,sizingInformation)=>
                  SafeArea(
                      child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              apptitile(),
                              SizedBox(
                                height:sizingInformation.screenSize.height *.01,
                              ),
                              appsubtitle(text: 'appsubtitle1'.tr().toString()),
                              SizedBox(
                                height: 5,
                              ),
                              appsubtitle(text: "appsubtitle2".tr().toString()),
                              SizedBox(
                                height:sizingInformation.screenSize.height *.05,
                              ),
                              Stack(
                                children: [
                                  background_splach(),
                                  Center(child:appbuutun()),
                                ],)
                            ],
                          ))))
    );
  }
}