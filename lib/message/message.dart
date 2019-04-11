import 'package:flutter/material.dart';
import '../widget/ContainerOuter.dart';
import '../test/statemanage.dart';
import '../test/jsonfetch.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Outer(
        mChild: ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: 13,
    ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
//                builder: (context) => MyStatePage(
//                      contentBox: "123123",
//                    )
                builder: (context) => MyJsonFetch()));
      },
      child: Container(
          height: 72,
          child: Card(
              margin: EdgeInsets.fromLTRB(3, 2, 3, 2),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                    child: CircleAvatar(
                      child: Image(
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1180416554,3435973739&fm=26&gp=0.jpg")),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(6, 12, 0, 0),
                        child: Text(
                          "NickName",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                        child: Text(
                          "message",
                          style:
                              TextStyle(color: Colors.black38, fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}
