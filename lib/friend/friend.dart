import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FriendPageState();
  }

}

class FriendPageState extends State<FriendPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Text("Friend",style: TextStyle(fontSize: 28.0,color: Colors.black26),),
    );
  }
}