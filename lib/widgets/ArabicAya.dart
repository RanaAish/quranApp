import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:alquran_alkarim/providers/setting.dart';
import 'package:provider/provider.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';

class Aya extends StatelessWidget {

  String text;
  int index;
  Alignment alignment;
  Aya({Key key, this.text,this.alignment,this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme= Provider.of<SettingsProvider>(context);
    return ResponsiveBuilder(
      builder: (context, sizeInfo) =>
          Align(
            child:Padding(
                padding:alignment==Alignment.topRight? EdgeInsets.only(right: 17):EdgeInsets.only(right:0),
                child: Text(text,style:
                theme.gettheme()==AppThemes.dark?AppTextStyles.AyainArabicdark:
                AppTextStyles.AyainArabic)),
            alignment:alignment,
          ),
    );
  }
}