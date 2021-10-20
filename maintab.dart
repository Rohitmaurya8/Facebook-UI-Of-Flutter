import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_lite_ui/pages/friend_page.dart';
import 'package:flutter_facebook_lite_ui/pages/home_page.dart';
import 'package:flutter_facebook_lite_ui/pages/market_page.dart';
import 'package:flutter_facebook_lite_ui/pages/message_page.dart';
import 'package:flutter_facebook_lite_ui/pages/notification_page..dart';
import 'package:flutter_facebook_lite_ui/pages/video_page.dart';
import 'package:flutter_facebook_lite_ui/widgets/home/mydrawer.dart';
import 'package:badges/badges.dart';

class MainTab extends StatefulWidget {
  MainTab({Key? key}) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> topTabs = <Tab>[
    Tab(icon: Icon(Icons.home_outlined)),
    Tab(icon: Icon(Icons.people_outlined)),
    Tab(icon: Icon(Icons.message_outlined)),
    Tab(
      icon: Badge(
        position: BadgePosition.topEnd(top: -20, end: -5),
        badgeContent:
            Text("3", style: TextStyle(fontSize: 18, color: Colors.white)),
        child: Icon(Icons.notifications_outlined),
      ),
    ),
    Tab(icon: Icon(Icons.video_library_outlined)),
    Tab(icon: Icon(Icons.shopping_bag_outlined)),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: topTabs.length, initialIndex: 0, vsync: this)
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

  Future<bool> onWillPop() async {
    print("on will pop");
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }
    Future.delayed(Duration(milliseconds: 200), () {
      print('Set Index');
      _tabController?.index = 0;
    });

    print("Return");
    return _tabController?.index == 0;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              'Facebook',
              style: TextStyle(fontSize: 35, color: Colors.blue[700]),
            ),
            actions: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.search),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                  // print('Search Button Clicked');
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    print('Menu Button Clicked');
                  },
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.blue[500],
              tabs: topTabs,
            ),
          ),
          endDrawer: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyDrawer(),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              HomePage(),
              FriendPage(),
              MessagePage(),
              NotificationPage(),
              VideoPage(),
              MarketPlacePage(),
            ],
          )),
    );
  }
}
