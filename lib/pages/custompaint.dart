import 'package:alquran_alkarim/utils/thmes/text.style.dart';
import 'package:flutter/material.dart';
import 'package:alquran_alkarim/pages/progress_painter.dart';
import 'dart:ui';
import 'package:alquran_alkarim/utils/themes/colors.dart';

class CustomDemo extends StatefulWidget {

  CustomDemo() : super();
  static String id = "CustomDemo";


  @override
  CustomDemoState createState() => CustomDemoState();
}

class CustomDemoState extends State<CustomDemo>
    with SingleTickerProviderStateMixin {

  double _percentage;
  double _nextPercentage;
  AnimationController _progressAnimationController;
  bool _progressDone;
  int i=0;
  var tasbeeh =["سُبْحَانَ اللَّه","الْحَمْدُ للّهِ","اللَّهُ أَكْبَرُ ","لاإِلَه إِلاللَّهُ","أسْتَغْفِرُ اللَّه"];

  @override
  initState() {
    super.initState();
    _percentage = 0.0;
    _nextPercentage = 0.0;
    _progressDone = false;
    initAnimationController();
  }

  initAnimationController() {
    _progressAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..addListener(
          () {
        setState(() {
          _percentage = lerpDouble(_percentage, _nextPercentage,
              _progressAnimationController.value);
        });
      },
    );
  }

  publishProgress() {
    setState(() {
      _percentage = _nextPercentage;
      _nextPercentage += 1;
      if (_nextPercentage > 33.0 ) {
        _percentage =0.0;
        _nextPercentage =0.0;
        if(i<4)
          {
            i=i+1;
          }
        else
          {
            i=0;
          }
        _progressDone=true;
      }
      _progressDone=false;
      _progressAnimationController.forward(from: 0.0);
    });
  }

  minmizeprogrss ()
  {
    setState(() {
      _percentage = _nextPercentage;
      _nextPercentage -= 1;
      if (_nextPercentage <= 0) {
        _percentage =0.0;
        _nextPercentage =0.0;
      }
      _progressAnimationController.forward(from: 0.0);
    });
  }

  getDoneImage() {
    return Image.asset(
      "images/checkmark.png",
      width: 50,
      height: 50,
    );
  }

  getProgressText (String t ) {
    return
   Column( mainAxisAlignment: MainAxisAlignment.center,
       children: [
      Text("$t",style: TextStyle(
       fontSize: 24, fontWeight: FontWeight.w800),
    ),
      Text(
      _nextPercentage == 0 ? '' : '${_nextPercentage.toInt()}',
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w800, color:  CustomColors.darkBlue),
    )]);
  }

  progressView() {
    return CustomPaint(
      child: Center(
        child: _progressDone ?  publishProgress() : getProgressText(tasbeeh[i]),
      ),
      foregroundPainter: ProgressPainter(
          defaultCircleColor:CustomColors.kwhite,
          percentageCompletedCircleColor:CustomColors.kSecondaryGreyColor,
          completedPercentage: _percentage,
          circleWidth: 14.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth=MediaQuery.of(context).size.width;
    double screenheight=MediaQuery.of(context).size.height;



    return Scaffold(
      body:Container(

        //for full screen set heightFactor: 1.0,widthFactor: 1.0,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/Creative Background Blue And White Pattern H5.jpg"),
          fit: BoxFit.fill,
    )),
        /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Ancient Decorations - Wedding Invitation Template (free) _ Greetings Island.png"),
              fit: BoxFit.cover,
            )),*/
       child:
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LayoutBuilder(
                builder: (context,constrains){
                  double localheight=constrains.maxHeight;
                  double localwidth=constrains.maxWidth;
                  print( "w $screenwidth");
                  print("h $screenheight");
                 return Container(
                   //200
                    height:localwidth/2+11,
                 // width: localwidth/2+11,
                     width:screenwidth<=360&&screenheight<=740? localwidth/2+11:localwidth/2,
                    padding: EdgeInsets.all(36.0),
                    margin:screenwidth<=360&&screenheight<=740?EdgeInsets.only(top: 70,left:94):EdgeInsets.only(top: 80,left:107),
                   //margin: EdgeInsets.only(top: 70,left:94),
                    child: progressView(),
                  );
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top:70),
                  child:Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      RaisedButton(
                        child:Center(child: Text('-1',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.white)),),
                        color: Colors.black12,
                        onPressed: () {
                          minmizeprogrss();
                        },),
                      SizedBox(width: 20,),
                      RaisedButton(
                        child:Center(child: Text('+1',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,color: Colors.white),)),
                        color: CustomColors.kSecondaryGreyColor,
                        onPressed: () {
                          publishProgress();
                        },),
                    ],))),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                 child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                    Icon(
                      Icons.circle,
                      color: Colors.black12,
                      size: 60.0,
                    ),  GestureDetector(
                  onTap: ()
                  {
                    i=0;
                    _nextPercentage=0;
                    //progressView();
                    //publishProgress();
                  },child:
                      Icon(Icons.refresh,size: 38,))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));
  }
}