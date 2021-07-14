import 'dart:core';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:alquran_alkarim/pages/splash.page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'dart:core' as hack;
class splachscreen extends StatefulWidget {

  static hack.String id = "splachscreen";

  @override
  _splachscreenState createState() => _splachscreenState();
}


class _splachscreenState extends State<splachscreen> {
  @override
  void initState() {
    
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushNamed(context,SplashPage.id);
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Container(
        alignment: Alignment.center,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset('assets/images/holy-quran (1).json'),
            ),
            SizedBox(height: 20,),
            Text("Holy Quran",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.orange),),
            SizedBox(height: 50,),
            SpinKitRipple(color:CustomColors.kMainColor)
          ]
        ),
      ),
    );
  }
}
