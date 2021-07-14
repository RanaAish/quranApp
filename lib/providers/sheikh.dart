import 'package:flutter/cupertino.dart';

class sheikh extends ChangeNotifier
{
  String name="ar.abdurrahmaansudais";
  bool change =false;
  changeshiekh(String n,bool c)
  {
    this.name=n;
    this.change=c;
    notifyListeners();
  }
}