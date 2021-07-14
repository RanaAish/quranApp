import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:alquran_alkarim/providers/setting.dart';
import 'package:provider/provider.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';

class UserBasicInfo extends StatelessWidget {
  const UserBasicInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme= Provider.of<SettingsProvider>(context);
    return ResponsiveBuilder(
      builder: (context, sizeInfo) =>
          Padding(
            padding: EdgeInsets.all(sizeInfo.screenSize.width * .03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Asslamualaikum",
                  style: theme.gettheme()==AppThemes.dark?AppTextStyles.WelcomTextdark:AppTextStyles.WelcomText,
                ),
                Text(
                  "Tanvir Ahassan",
                  style:theme.gettheme()==AppThemes.dark?AppTextStyles.UserNamedark: AppTextStyles.UserName,
                ),
              ],
            ),
          ),
    );
  }
}