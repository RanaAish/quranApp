import 'dart:core';
import 'package:alquran_alkarim/models/pageresponse.dart';
import 'package:alquran_alkarim/providers/bookmark.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:alquran_alkarim/services/Quran_services.dart';
import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import'dart:core' as hack;
import 'package:alquran_alkarim/providers/setting.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';

class readindsurah extends StatefulWidget {
  static hack.String id = "readindsurah";
  @override
  _readindsurahState createState() => _readindsurahState();
}
class _readindsurahState extends State<readindsurah> {
  Box arabicayabox;
  QuranApi response = new QuranApi();
  Future<pageresponse> pages;
  int _currentindex = 0;
  final scrollDirection = Axis.horizontal;
  PageController pageController = PageController(initialPage: 0);
  AnimationController controller;
  final TransformationController _transformationController =
  TransformationController();
  final TransformationController _transformation =
  TransformationController();
  bool _isConnected;

  // This function is triggered when the floating button is pressed
  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    arabicayabox = Hive.box('arabicaya');
    _checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = ModalRoute.of(context).settings.arguments;
    final theme= Provider.of<SettingsProvider>(context);
    List firstarray = [
      "assets/images/Alfatah.jpg",
      "assets/images/Al_bakra.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor:theme.gettheme()==AppThemes.dark?Colors.black45:CustomColors.kwhite,
        title: Text(arabicayabox.get(i).name,
            style: AppTextStyles.appBarEnglishText),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: CustomColors.kSecondaryGreyColor,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (int i) {
          setState(() {
            _currentindex = i;
            if (i == 0) {
              Provider.of<bookmark>(context, listen: false).changeindex(true);
            } else {
              _scrollToIndex(arabicayabox.get(i).number);
            }
          });
        },
        selectedItemColor: CustomColors.kMainColor,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.bookmark),
            label: "Save mark",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            label: "Move to mark",
          ),
        ],
      ),
      body: FutureBuilder (
          future: Hive.openBox('arabicaya'),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              final obj_from_box = arabicayabox.get(i);
              pages = response.fetchpage(obj_from_box.number);
              if(_isConnected == true )
                {  return Center(
                    child: Container(
                        color: theme.gettheme()==AppThemes.dark?Colors.white:null,
                        child: FutureBuilder(
                          future: pages,
                          builder: (context, snapshot) {
                            return Flexible(
                                child: PageView.custom(
                                    reverse: true,
                                    controller: pageController,
                                    childrenDelegate:SliverChildBuilderDelegate((BuildContext context, int index) {
                                      if (Provider.of<bookmark>(context, listen: false)
                                          .tap ==
                                          true) {
                                        if (index != 0)
                                          Provider.of<bookmark>(context, listen: false)
                                              .changebookmark(obj_from_box.number,
                                              index + snapshot.data.start);
                                        else
                                          Provider.of<bookmark>(context, listen: false)
                                              .changebookmark(obj_from_box.number,
                                              index + snapshot.data.start);
                                        Provider.of<bookmark>(context, listen: false)
                                            .changeindex(false);
                                      }
                                      return Container(

                                          child: index == 0 && snapshot.data.number <3
                                              ? Stack(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  top: 22,
                                                ),
                                                padding: EdgeInsets.all(0),
                                                width: 400,
                                                height: 618,
                                                child: InkWell(
                                                    onTap: ()
                                                    {
                                                      _transformation.value=Matrix4.identity();
                                                    },
                                                    child: InteractiveViewer(
                                                        transformationController: _transformation,
                                                        // maxScale:0.5,
                                                        child:
                                                        Image.asset(
                                                          firstarray[
                                                          snapshot.data.number -
                                                              1],
                                                        ))),
                                              ),
                                              Positioned(
                                                top: -5,
                                                left: 10,
                                                child: Align(
                                                  child: (obj_from_box.number ==
                                                      Provider.of<bookmark>(context)
                                                          .surahindex &&
                                                      index +
                                                          snapshot.data
                                                              .start ==
                                                          Provider.of<bookmark>(
                                                              context)
                                                              .pageindex)
                                                      ? IconButton(
                                                      icon: Icon(
                                                          Icons.bookmark,
                                                          color: Colors
                                                              .redAccent,
                                                          size: 50),
                                                      onPressed: null)
                                                      : IconButton(
                                                      icon: Icon(
                                                          Icons.bookmark,
                                                          color:
                                                          Colors.redAccent,
                                                          size: 0),
                                                      onPressed: null),
                                                  alignment: Alignment.topLeft,
                                                ),
                                              )
                                            ],
                                          )
                                              : Stack(children: [
                                            Container(
                                              width: 370,
                                              height: 613,
                                              margin: EdgeInsets.only(
                                                  top: 28, right: 10,left: 10),
                                              padding: EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          5.0))),
                                              child: InkWell(
                                                  onTap: ()
                                                  {
                                                    _transformation.value=Matrix4.identity();
                                                  },
                                                  child:InteractiveViewer(
                                                    //maxScale:0.5,
                                                      transformationController: _transformationController,
                                                      child: Image.asset(
                                                        "assets/quran-images/${index + snapshot.data.start}.png",
                                                        width: 100,
                                                        height: 100,
                                                      ))
                                              ),),
                                            Positioned(
                                              top: -8,
                                              left: 10,
                                              child: Align(
                                                child: (obj_from_box.number ==
                                                    Provider.of<bookmark>(
                                                        context)
                                                        .surahindex &&
                                                    index + snapshot.data.start ==
                                                        Provider.of<bookmark>(
                                                            context)
                                                            .pageindex)
                                                    ? IconButton(
                                                    icon: Icon(
                                                        Icons.bookmark,
                                                        color: Colors
                                                            .redAccent,
                                                        size: 50),
                                                    onPressed: null)
                                                    : IconButton(
                                                    icon: Icon(
                                                        Icons.bookmark,
                                                        color:
                                                        Colors.redAccent,
                                                        size: 0),
                                                    onPressed: null),
                                                alignment: Alignment.topLeft,
                                              ),
                                            ),
                                            Positioned(
                                                left: 180,
                                                top: 1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        "(${index + snapshot.data.start})",
                                                        style: TextStyle(
                                                            fontSize: 15)),
                                                  ],
                                                )),
                                          ]));
                                    },childCount:snapshot.data.end,)
                                )
                            );
                          },
                        )));}
               else
                 { return
                   Container(
                     // margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                     decoration: BoxDecoration(
                         image: DecorationImage(
                             image: AssetImage("assets/images/no net.png"),
                             fit:BoxFit.cover
                         )
                     ),
                   );}

            } else {
            }
          }),
    );
  }

  Future _scrollToIndex(int surah) async {
     if (Provider.of<bookmark>(context,listen: false).surahindex== surah)
       {
         await  pageController.animateToPage(Provider.of<bookmark>(context,listen: false).pageindex-2,
             duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
       }
  }
}

