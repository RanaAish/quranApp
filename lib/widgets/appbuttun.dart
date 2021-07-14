import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import'package:alquran_alkarim/pages/home.page.dart';

class appbuutun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 180,
      margin: EdgeInsets.only(top: 370),
      padding: EdgeInsets.only(top: 20, bottom: 110),
      child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  HomePage()),
            );
          },
          child: Text(
            "startbutun".tr().toString(),
            style: AppTextStyles.buttuntitile,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: CustomColors.kbuttunColor),
    );
  }
}