import 'package:flutter/cupertino.dart';

class bookmark extends ChangeNotifier
{
  int surahindex,pageindex,surahaudioindex,pageaudioindex;
  bool tap;
  changebookmark(int si,int pi)
   {
    surahindex=si;
    pageindex=pi;
    notifyListeners();
   }
   changeindex(bool i)
   {
    tap=i;
     notifyListeners();
   }
   changeindexforaudio(int si, int pi)
   {
     surahaudioindex=si;
     pageaudioindex=pi;
     notifyListeners();
   }
}