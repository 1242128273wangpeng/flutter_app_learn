import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'storage.dart';

class ChangeBox extends StatelessWidget {
  ChangeBox({Key key, this.isCheck: false, this.onChange, this.content})
      : super(key: key) {
    print("ontap ChangeBox init isCheck:$isCheck");
  }

  final bool isCheck;
  final ValueChanged<bool> onChange;
  final String content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onHandlerTap,
      child: Container(
        child: Text(
          content,
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        height: 80.0,
        width: 80.0,
        color: isCheck ? Colors.blue : Colors.grey,
      ),
    );
  }

  _onHandlerTap() {
    print("onHandlerTap");
    onChange(!isCheck);
  }
}

class MySharePreference extends StatefulWidget {
  final MyStorage myStorage;

  MySharePreference({Key key, this.myStorage}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MySharePreference> {
  var nameController = TextEditingController();
  var pwdController = TextEditingController();
  var fileNameController = TextEditingController();
  var filePwdController = TextEditingController();
  String res = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('shared Preferences'),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "please enter name"),
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(hintText: "please enter password"),
                controller: pwdController,
              )
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(6),
                child: RaisedButton(
                    child: Text("save data"),
                    onPressed: () => saveClick(nameController, pwdController)
                    // ignore: missing_required_param
                    ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: RaisedButton(
                  child: Text("read data"),
                  onPressed: () => readClick(nameController, pwdController),
                ),
              )
            ],
          ),
          Text(res),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: fileNameController,
                decoration:
                    InputDecoration(hintText: "please enter name as file"),
              ),
              TextField(
                controller: filePwdController,
                decoration:
                    InputDecoration(hintText: "please enter pwd as file"),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(6),
                  child: RaisedButton(
                    onPressed: () =>
                        saveFileClick(fileNameController, filePwdController),
                    child: Text("save"),
                  )),
              Padding(
                  padding: EdgeInsets.all(6),
                  child: RaisedButton(
                    onPressed: () =>
                        readFileClick(fileNameController, filePwdController),
                    child: Text("read"),
                  ))
            ],
          ),
        ])));
  }

  saveClick(TextEditingController nameController,
      TextEditingController pwdController) async {
    final perfs = await SharedPreferences.getInstance();
    perfs.setString(nameController.text, pwdController.text);
  }

  readClick(TextEditingController nameController,
      TextEditingController pwdController) async {
    final perfs = await SharedPreferences.getInstance();
    setState(() {
      res = perfs.getString(nameController.text);
    });
  }

  saveFileClick(TextEditingController fileNameController,
      TextEditingController filePwdController) {}

  readFileClick(TextEditingController fileNameController,
      TextEditingController filePwdController) {}
}
