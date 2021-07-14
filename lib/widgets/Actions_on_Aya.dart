import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:alquran_alkarim/utils/themes/colors.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:share/share.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:io';
import 'package:alquran_alkarim/providers/bookmark.dart';
import 'package:provider/provider.dart';
import 'package:alquran_alkarim/providers/setting.dart';
import 'package:provider/provider.dart';
import 'package:alquran_alkarim/utils/themes/themes.dart';

class Actions_on_Aya extends StatefulWidget {
 final String url,arabicaya,englishaya;
 final int number ,lengthofayahs ,surahnumber;

 const Actions_on_Aya({Key key, this.url,this.arabicaya,this.englishaya,this.number,this.lengthofayahs,this.surahnumber}) : super(key: key);
 @override
 _Actions_on_AyaState createState() => _Actions_on_AyaState();
}

class _Actions_on_AyaState extends State<Actions_on_Aya> {
 AudioPlayer audioPlayer = new AudioPlayer();



 final player = AssetsAudioPlayer.withId("id");
 bool _isConnected;
 int dur =0;
 int currentIndex = 0;

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
 Duration _duration=new Duration();
 // This will check the connection at the beginning
 @override
 void initState() {
   _checkInternetConnection();
   audioPlayer.onPlayerCompletion.listen((event) async {
     var res = await audioPlayer.pause();
     if (res == 1) {
       if (this.mounted) {
         setState(() {
           playing = false;
         });
       }
     }
   });
   //audioPlayer.onDurationChanged.listen((d) => setState(() => _duration = d));
   }
 bool playing = false;
 @override
 Widget build(BuildContext context) {
   final theme= Provider.of<SettingsProvider>(context);
  return ResponsiveBuilder(
   builder: (context, sizeingInfo) => Card(
       color: CustomColors.lightgrey,
       elevation: 0,
       shape:
       RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
       child: ListTile(
        trailing: Padding(
         padding:
         EdgeInsets.only(right: sizeingInfo.screenSize.height * 0.01),
         child: Wrap(
          spacing: 15, // space between two icons
          children: <Widget>[
           GestureDetector(
           child: Icon(
            Icons.share,
            color: theme.gettheme()==AppThemes.dark?Colors.white: CustomColors.kMainColor,
           ),
               onTap: (){
                Share.share('(${widget.arabicaya}) (${widget.englishaya})');
               }
         ),
           /// icon-2
           GestureDetector(
               onTap: () async {
               /* player.open(
                    Playlist(
                        audios: [
                         Audio("https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/2"),
                         //for (int i=widget.number;i<widget.lengthofayahs;i++)
                         //Audio("https://cdn.alquran.cloud/media/audio/ayah/ar.alafasy/${i}")
                        ]
                    ),
                    loopMode: LoopMode.playlist //loop the full playlist
                );*/
                if (playing ) {
                 var res = await audioPlayer.pause();
                 if (res == 1) {
                  setState((){
                   playing = false;
                   //print('duration ${dur}');
                   //print('d ${_duration.inSeconds.toInt()}');
                  });
                 }
                } else {
                 var res = await audioPlayer.play(widget.url, isLocal: true);
                 //dur = await audioPlayer.getDuration();
                 if (res == 1) {
                  setState(() {
                   playing = true;
                  });
                 }
                }
               },
               child: _isConnected == true ?Icon(
                playing == false
                    ? Icons.play_circle_outline
                    : Icons.pause_circle_outline,
                color:theme.gettheme()==AppThemes.dark?Colors.white: CustomColors.kMainColor,
               ):Text("")),
           // icon-1
           GestureDetector(
             onTap: ()
             {
               setState(() {
                 Provider.of<bookmark>(context, listen: false).changeindexforaudio(widget.surahnumber,widget.number);
               });
             },
             child: Provider.of<bookmark>(context, listen: false).pageaudioindex==widget.number?Icon(
               Icons.bookmark,
               color: Colors.red,

             ):Icon(
               Icons.bookmark_border,
               color: theme.gettheme()==AppThemes.dark?Colors.white: CustomColors.kMainColor,

             ),
           ),
          ],
         ),
        ),
        leading: Stack(
         alignment: Alignment.center,
         children: <Widget>[
          Icon(
           Icons.circle,
           color: CustomColors.kMainColor,
           size: 30.0,
          ),
          Text(widget.number.toString(), style:AppTextStyles.NumberofAya),
         ],
        ),
       )),
  );
 }
}