import 'package:flutter/material.dart';
import '../widget/ContainerOuter.dart';
import 'package:sider_bar/sider_bar.dart';

class FriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FriendPageState();
  }
}

class FriendPageState extends State<FriendPage> {
  List<String> mDataList;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    String content = "ABCDEFGHIGKLMNOPQRSTUVWXYZ";
    super.initState();
    mDataList =
        List<String>.generate(content.length, (index) => content[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Outer(
      mChild: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: <Widget>[
          ListView.builder(
            controller: _controller,
            itemCount: mDataList.length,
            itemBuilder: buildItem,
          ),
          SideBar(
              list: mDataList,
              textColor: Colors.redAccent,
              color: Colors.redAccent.withOpacity(0.2),
              valueChanged: (value) {
                _controller
                    .jumpTo(mDataList.indexOf(value) * 44.0); //card 差不多44的高度
              })
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.fromLTRB(3, 2, 3, 2),
      child: ListTile(
        title: Text(mDataList[index]),
      ),
    );
  }
}
