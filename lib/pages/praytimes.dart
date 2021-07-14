import 'package:alquran_alkarim/models/data.dart';
import 'package:alquran_alkarim/models/json_connection.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:alquran_alkarim/providers/setting.dart';
import 'package:provider/provider.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';

class PrayTimes extends StatefulWidget {
  PrayTimes({Key key}) : super(key: key);
  static String id = "payerTimes";

  @override
  _PrayTimesState createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {

  JsonConnection jsonConnection = new JsonConnection();
  Data list;
  static String city = 'Dammam';
  static String country = 'Saudi Arabia';
  static int method = 4;
  List texts=['Fajr','Dhuhr','Asr','Maghrib','Isha'];
  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';

  Future getPTData() async {
    http.Response res = await http.get(Uri.encodeFull(url), headers: {
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    final data = jsonDecode(res.body);

    list = Data.fromJson(data);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final theme= Provider.of<SettingsProvider>(context);
    return Scaffold(

      appBar: AppBar(
        title: Text('Pray Times',style:theme.gettheme()==AppThemes.dark?AppTextStyles.appBarEnglishTextdark:AppTextStyles.appBarEnglishText),
    backgroundColor:theme.gettheme()==AppThemes.dark?Colors.black45:Colors.white,
    elevation: 0,
    leading: IconButton(
    onPressed: () {
    Navigator.of(context).pop();
    },
    icon: Icon(
    Icons.arrow_back,
    color: CustomColors.kSecondaryGreyColor,
    ),
      )),
      backgroundColor: theme.gettheme()==AppThemes.dark?Colors.black45:Colors.white,
      body: FutureBuilder(
        future: jsonConnection.getPTLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List times=[snapshot.data.data.timings.fajr,snapshot.data.data.timings.dhuhr,snapshot.data.data.timings.asr,snapshot.data.data.timings.maghrib,
          snapshot.data.data.timings.isha
          ];
            return
             Container(
              width:500,
               height: double.infinity,
               child:SingleChildScrollView(
               scrollDirection: Axis.vertical,child:Column(
                   children:[
                     SizedBox(height: 20,),
                     Image.asset( theme.gettheme()==AppThemes.dark?"assets/images/output-onlinepngtools.png":
                     "assets/images/muslim-people-going-to-mosque-for-prayer-vector-37520566.jpg",width: 400,height: 280,),

                    Container(
                      height: 400,
                        child: Padding(
                        padding: const EdgeInsets.only(top:0,right:8,left:8,bottom:8),
                        child:ListView.builder(itemBuilder:(context,index)=>Container( padding:EdgeInsets.only(top: 5,right: 10,left: 10) ,child: Card(  elevation: 2,
                          shape: RoundedRectangleBorder(
                              side: BorderSide( color:CustomColors.purple, width: 0.5),
                              borderRadius: BorderRadius.circular(50)),
                          child: ListTile(title:Text(texts[index]),
                              trailing: Text(times[index])),),),itemCount:times.length)))

                   ]
               )
    ));
          } else  {
            return Center(child:CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
