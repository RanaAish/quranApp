import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:alquran_alkarim/pages/Surahdetails.dart';
import 'package:alquran_alkarim/pages/readingsurah.dart';
import 'package:alquran_alkarim/providers/setting.dart';
import 'package:provider/provider.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';


class SurahTitleDetials extends StatelessWidget {

  String name,englishName,englishNameTranslation,revelationType,numberOfAyahs,number;
  int endindex,index,currentindex;
  SurahTitleDetials({Key key, this.name,this.englishName,this.revelationType,this.numberOfAyahs,this.number,this.index,this.currentindex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    endindex=name.indexOf(' ');
    final theme= Provider.of<SettingsProvider>(context);
    // print(endindex);
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            if (currentindex==1)
            {
              Navigator.of(context).pushNamed(Surahdetails.id,arguments:index);
            }
            else
            {
              Navigator.of(context).pushNamed(readindsurah.id,arguments:index);
            }

          },
          child:  ListTile(
              leading: ResponsiveBuilder(
                builder: (context, sizeInfo) => Container(
                    width: sizeInfo.screenSize.width * .1,
                    height: sizeInfo.screenSize.height * .1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/number_icon.png"))),
                    child: Center(
                        child: Text(
                          number.toString(),
                          style:theme.gettheme()==AppThemes.dark?AppTextStyles.SurahNumberdark:AppTextStyles.SurahNumber,
                        ))),
              ),
              title: Text(englishName, style: theme.gettheme()==AppThemes.dark?AppTextStyles.SurahEnglishNamedark: AppTextStyles.SurahEnglishName),
              subtitle: Row(
                children: [
                  Text(
                    revelationType,
                    style: AppTextStyles.SurahDetials,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.circle,
                      size: 5,
                    ),
                  ),
                  Text(
                    "${numberOfAyahs} - VERSES",
                    style: AppTextStyles.SurahDetials,
                  ),
                ],
              ),
              trailing: Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  name.substring(endindex,name.length-1),
                  style:theme.gettheme()==AppThemes.dark?AppTextStyles.SurahArabicNamedark: AppTextStyles.SurahArabicName,
                ),
              )
          ),
        ),
        Divider()
      ],
    );
  }
}