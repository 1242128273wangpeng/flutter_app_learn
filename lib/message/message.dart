import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MessagePageState();
  }

}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18.0),
      decoration: BoxDecoration(color: Colors.c,borderRadius: BorderRadius.circular(10.0),border: Border.all(width:1.0,color: Colors.green)),
      child: ListView.builder(itemBuilder: _itemBuilder,itemCount: 5,),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
      Text("nickName"),
      Text("time"),
      Text("content"),
    ],);
  }
}