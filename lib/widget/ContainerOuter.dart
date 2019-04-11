import 'package:flutter/material.dart';

class Outer extends StatelessWidget {
  final Widget mChild;

  const Outer({Key key, this.mChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
      decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1.0, color: Colors.white)),
      child: mChild,
    );
  }
}
