import 'dart:math';

import 'package:flutter/material.dart';
import 'changebox.dart';

class MyStatePage extends StatefulWidget {
  String contentBox;

  MyStatePage({Key key, String contentBox}) : super(key: key) {
    print("MyStatePage init _contentBox：$contentBox");
    this.contentBox = contentBox;
  }

  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<MyStatePage> {
  bool _isCheck = false;

  _MyState() {
    print("_MyState init");
  }

  void _onHandlerBox(bool newValue) {
    print("parent call newValue:$newValue");
//    widget.
    setState(() {
      _isCheck = newValue;
      widget.contentBox = Random().nextInt(800).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
//      child: ChangeBox(onChange: _onHandlerBox, isCheck: _isCheck,content: widget.contentBox,),
      child: MySharePreference(),
    );
  }
}
