import 'package:alquran_alkarim/providers/sheikh.dart';
import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:alquran_alkarim/widgets/SurahTitleDetials.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:alquran_alkarim/services/Quran_services.dart';
import 'package:alquran_alkarim/models/sheukh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:alquran_alkarim/providers/setting.dart';
import 'package:provider/provider.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';

class TabsOfHome extends StatefulWidget {
  int currentindex;
  List fllteredsurah = [];
  bool issearching;
  TabsOfHome({Key key, this.currentindex, this.fllteredsurah, this.issearching})
      : super(key: key);
  @override
  _TabsOfHomeState createState() => _TabsOfHomeState();
}

class _TabsOfHomeState extends State<TabsOfHome> {
  QuranApi quran = QuranApi();
  Future<List> DATA, englishAyahs;
  Box arabicayabox, englishayabox;
  TabController controller;
  FToast fToast;

  @override
  void initState(){
    // TODO: implement initState
    fToast = FToast();
    fToast.init(context);
    arabicayabox = Hive.box('arabicaya');
    englishayabox = Hive.box('englishaya');
    if (arabicayabox.isEmpty || englishayabox.isEmpty) {
      DATA = quran.fetch_names_of_surahs(
          'http://api.alquran.cloud/v1/quran/${Provider.of<sheikh>(context, listen: false).name}');
      englishAyahs = quran
          .fetch_names_of_surahs('http://api.alquran.cloud/v1/quran/en.asad');
      quran.putdata(DATA, arabicayabox);
      quran.putdata(englishAyahs, englishayabox);
    }
    super.initState();
  }

  clearingdata() async {
    await arabicayabox.clear();
    await englishayabox.clear();
  }
  @override
  Widget build(BuildContext context) {
    final shiekh = Provider.of<sheikh>(context, listen: false);
    final theme= Provider.of<SettingsProvider>(context);
    return FutureBuilder(
        future: Hive.openBox('arabicaya'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData)
              return Center(child: new CircularProgressIndicator());
            return ResponsiveBuilder(
                builder: (context, sizeInfo) => DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: CustomColors.kMainColor,
                          labelStyle: AppTextStyles.tabBarHeader,
                          labelColor: theme.gettheme()==AppThemes.dark?CustomColors.kOfWhite:CustomColors.kMainColor,
                          tabs: [
                            Text(
                              "Surah",
                            ),
                            Text("Sheikh")
                          ],
                        ),
                        Container(
                            height: sizeInfo.screenSize.width * .8,
                            child: Flex(
                              direction:Axis.vertical,
                              children: [
                                Expanded(
                                  child: (TabBarView(
                                    children: [
                                      ListView.builder(
                                          itemCount: widget.issearching
                                              ? widget.fllteredsurah.length
                                              : arabicayabox.length,
                                          itemBuilder: (conext, i) {
                                            final obj_from_box = widget.issearching
                                                ? widget.fllteredsurah[i]
                                                : arabicayabox.get(i);
                                            return SurahTitleDetials(
                                              revelationType: obj_from_box
                                                  .revelationType
                                                  .toString(),
                                              name: obj_from_box.name.toString(),
                                              englishName: obj_from_box.englishName
                                                  .toString(),
                                              numberOfAyahs: obj_from_box
                                                  .ayahs.length
                                                  .toString(),
                                              number:
                                              obj_from_box.number.toString(),
                                              index: obj_from_box.number - 1,
                                              currentindex: widget.currentindex,
                                            );
                                          }),
                                      ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Column(
                                              children:[
                                                GestureDetector(
                                                  onTap: ()
                                                  {
                                                    shiekh.changeshiekh(sheukth.user[index]["identifier"], true);
                                                    _showToast();

                                                  },
                                                  child:
                                                  ListTile(
                                                    leading: CircleAvatar(
                                                      backgroundImage: AssetImage(sheukth.user[index]["image"]),
                                                      radius: 39,

                                                    ),
                                                    title:Text(sheukth.user[index]["englishName"],style:theme.gettheme()==AppThemes.dark? AppTextStyles.SurahEnglishNamedark
                                                        : AppTextStyles.SurahEnglishName),
                                                    subtitle: Row(
                                                      children: [
                                                        Text(
                                                          "Language:",
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
                                                          sheukth.user[index]["language"],
                                                          style: AppTextStyles.SurahDetials,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )]);
                                        },
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: sheukth.user.length,
                                      )
                                    ],
                                  )),
                                )],))
                      ],
                    )));
          } else {
            return Center(
                child: Center(child: new CircularProgressIndicator()));
          }
        });
  }
  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black26,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check,color: Colors.green,),
          SizedBox(
            width: 12.0,
          ),
          Text("sheikh is choosed",style:TextStyle(color: Colors.white,fontSize: 16),),
        ],
      ),
    );
    fToast.showToast(
      child:toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),


    );
  }
}