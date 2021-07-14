import 'package:flutter/material.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:easy_localization/easy_localization.dart';

class apptitile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context,sizingInformation)=>(
        Container(
            margin: EdgeInsets.only(top: sizingInformation.screenSize.height *.09, bottom: sizingInformation.screenSize.height *.01),
            padding: EdgeInsets.only(bottom: sizingInformation.screenSize.height *.01),
            child: Text('apptitle'.tr().toString(),style: AppTextStyles.appTitle,

            ))
    ));
  }
}
