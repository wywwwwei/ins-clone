import 'package:ins_like_app/page/feed_home.dart';
import 'package:ins_like_app/page/notification_page.dart';
import 'package:ins_like_app/page/post_page.dart';
import 'package:ins_like_app/page/profile_page.dart';
import 'package:ins_like_app/page/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  static const routeName =  "/HomeScreen";

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  int _curNavIndex = 0;
  PageController _pageController;

  @override
  void initState() {
      super.initState();
      _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller:  _pageController,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          PostPage(),
          NotificationPage(),
          ProfilePage(),
        ],
        onPageChanged: (int index){
          setState(() {
            _curNavIndex = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _curNavIndex,
        activeColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.add_box,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity,
            ),
            title: Container(),
          ),
        ],
        onTap: (int index){
          setState(() {
            _curNavIndex = index;
          });
          _pageController.jumpToPage(_curNavIndex);
        },
      ),
    );
  }
}