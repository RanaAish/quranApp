import 'dart:core';
import 'dart:core' as hack;
import 'package:alquran_alkarim/providers/setting.dart';
import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:alquran_alkarim/widgets/LastReadCard.dart';
import 'package:alquran_alkarim/widgets/TabsOfHome.dart';
import 'package:alquran_alkarim/widgets/UserBasicInfo.dart';
import 'package:flutter/material.dart';
import 'package:alquran_alkarim/pages/custompaint.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:alquran_alkarim/pages/praytimes.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';

// TODO :: HOME PAGE
class HomePage extends StatefulWidget {
 @override
 _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 int _currentIndex = 1;
 bool _light=false;
 bool issearching=false;
 bool check;
 List searchitems =[];
 TextEditingController searchcontroller =new TextEditingController();
 Box arabicayabox;
 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arabicayabox = Hive.box('arabicaya');
    searchcontroller.addListener(() {
      filttersurah();
    });
  }
  
 filttersurah()
 {
   if(searchcontroller.text.isNotEmpty)
     {

       var filteredsurah;
       RegExp exp = new RegExp("^[a-zA-Z0-9]*");
       exp.allMatches(searchcontroller.text).forEach((match) {
         if (match.group(0)!= "") {
           filteredsurah =arabicayabox.values
               .where((surah) =>surah.englishName.contains(searchcontroller.text))
               .toList();
         }
         else
           {
             filteredsurah =arabicayabox.values
                 .where((surah) =>surah.name.contains(searchcontroller.text))
                 .toList();
           }
       });
           setState(() {
             searchitems=filteredsurah;
           });
     }
 }

 @override
 Widget build(BuildContext context) {
   check=searchcontroller.text.isNotEmpty;
   final theme= Provider.of<SettingsProvider>(context);
   return  Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.sort,
                color: CustomColors.kSecondaryGreyColor,
              ),
            ),
          ),
          backgroundColor:!_light? Colors.white:Colors.black38,
          elevation: 0,
          actions: [
            issearching?
            new IconButton(
              onPressed: (){
                searchcontroller.clear();
                  setState(() {
                    this.issearching=false;
                  });
              },
              icon: Icon(
                Icons.cancel,
                color: CustomColors.kSecondaryGreyColor,
              ),
            ): new IconButton(
              onPressed: (){
                setState(() {
                  searchcontroller.clear();
                  this.issearching=true;
                });
              },
              icon: Icon(
                Icons.search,
                color: CustomColors.kSecondaryGreyColor,

              ),
            ),
          ],
          title: !issearching ?Text("Quran App", style:!_light?AppTextStyles.appBarEnglishText:AppTextStyles.appBarEnglishTextdark):TextField(style: TextStyle(color: Colors.black),
            decoration: InputDecoration(hintText: "Search Surah Here",hintStyle:
          TextStyle(color:theme.gettheme()==AppThemes.dark?Colors.white
              : Colors.black)),controller:searchcontroller ,),

        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.only(top:10),
            children: <Widget>[
              DrawerHeader(
                child:Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Center(child:Image.asset('assets/images/logo.png',width: 110,height: 110,))),
                decoration: BoxDecoration(
                   color:!_light? Colors.white:Colors.black38,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20),child: ListTile(

                leading: Image.asset('assets/images/spahah.png',width: 60,height: 60,),
                title: Text('Sbhah',style: TextStyle(fontSize: 19),),
                onTap: () {
                  Navigator.pushNamed(context, CustomDemo.id);
                },
              ),),
              Padding(padding: EdgeInsets.only(top: 20),
                  child:ListTile(

                    leading: Switch(value:_light,onChanged:(state){
                      setState(() {
                        _light=state;
                        if( _light)
                        {
                          theme.settheme(AppThemes.dark);
                        }
                        else
                        {
                          theme.settheme( AppThemes.light);
                        }
                      }
                      );
                    },),
                    title: Text('Dark mode',style: TextStyle(fontSize: 19),),
                    onTap: () {
                      Navigator.pushNamed(context, CustomDemo.id);
                    },
                  ),
              )
            ],
          ),
        ),
        body:SingleChildScrollView(child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [UserBasicInfo(),LastReadCard(),TabsOfHome(currentindex:_currentIndex,fllteredsurah:searchitems,issearching:check,),],

        )),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:!_light? Colors.white:Colors.black38,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
              if(_currentIndex ==2)
                {
                  Navigator.of(context).pushNamed(PrayTimes.id);
                }
            });
            print(_currentIndex);
          },
          items: [
            BottomNavigationBarItem(
                icon: _currentIndex == 0
                    ? _selctedIconStyle("holy-quran-selected.png")
                    : _unSelctedIconStyle("holy-quran.png"),
                label: ""),
            BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? _selctedIconStyle("reading-quran_selected.png")
                    : _unSelctedIconStyle("reading-quran.png"),
                label: ""),
            BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? _selctedIconStyle("medina-sherif-selected.png")
                    : _unSelctedIconStyle("medina-sherif.png"),
                label: ""),
          ],
        )
  );
 }

 Widget _unSelctedIconStyle(hack.String name) {
  return CircleAvatar(
      radius: 20,
      backgroundColor: CustomColors.kIconSecondaryBackground,
      child: Image.asset("assets/images/$name"));
 }

 Widget _selctedIconStyle(hack.String name) {
  return CircleAvatar(
      radius: 25,
      backgroundColor: CustomColors.kMainColor,
      child: Image.asset("assets/images/$name"));
 }
}
