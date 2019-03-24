import 'package:flutter/material.dart';
import 'friend/friend.dart';
import 'message/message.dart';
import 'moment/moment.dart';
import 'profile/profile.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tabImages;
  var appBarTitles = ['消息', '好友', '动态', '我的'];
  var _pageList;
  var _currIndex = 0;
  var navigationBars;

  Image getTabImage(String path) {
    return Image.asset(path, width: 24, height: 24);
  }

  void initData() {
    _pageList = [MessagePage(), FriendPage(), MomentPage(), ProfilePage()];
    tabImages = [
      [
        getTabImage("assets/images/ic_bottom_message_normal.png"),
        getTabImage("assets/images/ic_bottom_message_selected.png")
      ],
      [
        getTabImage("assets/images/ic_bottom_location_normal.png"),
        getTabImage("assets/images/ic_bottom_location_selected.png")
      ],
      [
        getTabImage("assets/images/ic_bottom_home_normal.png"),
        getTabImage("assets/images/ic_bottom_home_selected.png")
      ],
      [
        getTabImage("assets/images/ic_bottom_mine_normal.png"),
        getTabImage("assets/images/ic_bottom_mine_selected.png")
      ],
    ];
    navigationBars = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
      BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
      BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
      BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
    ];
  }

  getTabIcon(int currIndex) {
    if (_currIndex == currIndex) {
      return tabImages[currIndex][1];
    }
    return tabImages[currIndex][0];
  }

  getTabTitle(int currIndex) {
    if (_currIndex == currIndex) {
      return Text(
        appBarTitles[currIndex],
        style: TextStyle(fontSize: 14.0, color: const Color(0xFFFA5052)),
      );
    } else {
      return Text(
        appBarTitles[currIndex],
        style: TextStyle(fontSize: 14.0, color: const Color(0xFFA3AAB9)),
      );
    }
  }

  _onTap(int index) {
    setState(() {
      _currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(Icons.search),
          SizedBox(
            width: 18.0,
          ),
          Icon(Icons.add),
          SizedBox(
            width: 14.0,
          ),
        ],
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3107992244,1601176332&fm=26&gp=0.jpg"),
          ),
        ),
        child: _pageList[_currIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBars,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currIndex,
        iconSize: 24.0,
      ),
    );
  }
}
