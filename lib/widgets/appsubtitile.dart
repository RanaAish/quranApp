import 'package:flutter/material.dart';
import 'package:alquran_alkarim/utils/thmes/text.style.dart';

class appsubtitle extends StatefulWidget {
  final String text;
  const appsubtitle({Key key, this.text}) : super(key: key);
  @override
  _appsubtitleState createState() => _appsubtitleState();
}

class _appsubtitleState extends State<appsubtitle> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.text, style: AppTextStyles.appsubtitle));
    ;
  }
}
