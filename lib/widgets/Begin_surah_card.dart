import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:alquran_alkarim/utils/themes/colors.dart';




class Begin_surah_card extends StatefulWidget {
  final String name,englishName,englishNameTranslation,revelationType,numberOfAyahs;
  const Begin_surah_card({Key key, this.name,this.englishName,this.englishNameTranslation,this.revelationType,this.numberOfAyahs}) : super(key: key);
  @override
  @override
  _Begin_surah_cardState createState() => _Begin_surah_cardState();
}

class _Begin_surah_cardState extends State<Begin_surah_card> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) =>
          Stack(
            children: [
              Center(child:Container(
                margin: EdgeInsets.only(top: 25),
                width: 327,
                height: 257,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/quran_background.png'),
                      fit: BoxFit.fill,
                    )),
              ),),
              Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 55),
                    child: Text(widget.name,style:AppTextStyles.beginofaya.subtitle1),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: sizeInfo.screenSize.height*0.01),
                    child: Text(widget.englishNameTranslation,style:AppTextStyles.beginofaya.subtitle2),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: sizeInfo.screenSize.height*.01,right: 100,left:100),
                    child: Divider(color: CustomColors.kwhite ,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child:Text("${widget.revelationType} - ${widget.numberOfAyahs} Verses",style:AppTextStyles.beginofaya.bodyText1) ,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),

                    child:Image.asset("assets/images/text.png") ,
                  ),
                ],
              ) ,)
            ],
          ),
    );
  }
}


