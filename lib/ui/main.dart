import 'package:flutter/material.dart';
import 'package:wanandroid_client_app/common/static_info.dart';
import 'package:wanandroid_client_app/ui/fragemnt/home.dart';
import 'package:wanandroid_client_app/ui/fragemnt/ground.dart';
import 'package:wanandroid_client_app/ui/fragemnt/project.dart';
import 'package:wanandroid_client_app/ui/fragemnt/gzh.dart';
import 'package:wanandroid_client_app/ui/fragemnt/mine.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  PageController _pageController;

  int _nowIndex = 0;


  @override
  void initState() {
    _pageController = PageController();
    _tabController = TabController(length: 5, vsync: this)..addListener(
        (){
          _pageController.jumpToPage(_tabController.index);
          setState(() {
            _nowIndex = _tabController.index;
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeFragment(),
          GroundFragment(),
          ProjectFragment(),
          GzhFragment(),
          MineFragment()
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: TabBar(
          indicatorColor: Colors.white,
          isScrollable: false,
          indicatorWeight: 0.1,
          controller: _tabController,
            tabs: [
          Tab(
            child: _nowIndex == 0?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_home,size: 20,color: Theme.of(context).accentColor,),
                Text("首页",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 12),)
              ],
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_home,size: 20,color: Colors.grey,),
                Text("首页",style: TextStyle(color: Colors.grey,fontSize: 12),)
              ],
            ),
          ),
          Tab(
            child: _nowIndex == 1?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_ground,size: 20,color: Theme.of(context).accentColor,),
                Text("导航",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 12),)
              ],
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_ground,size: 20,color: Colors.grey,),
                Text("导航",style: TextStyle(color: Colors.grey,fontSize: 12),)
              ],
            ),
          ),
          Tab(
            child: _nowIndex==2?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_project,size: 20,color: Theme.of(context).accentColor,),
                Text("项目",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 12),)
              ],
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_project,size: 20,color: Colors.grey,),
                Text("项目",style: TextStyle(color: Colors.grey,fontSize: 12),)
              ],
            ),
          ),Tab(
            child: _nowIndex==3?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_gzh,size: 20,color: Theme.of(context).accentColor,),
                Text("公众号",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 12),)
              ],
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_gzh,size: 20,color: Colors.grey,),
                Text("公众号",style: TextStyle(color: Colors.grey,fontSize: 12),)
              ],
            ),
          ),
          Tab(
            child: _nowIndex==4?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_mine,size: 20,color: Theme.of(context).accentColor,),
                Text("我的",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 12),)
              ],
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(StaticInfo.icon_mine,size: 20,color: Colors.grey,),
                Text("我的",style: TextStyle(color: Colors.grey,fontSize: 12),)
              ],
            ),
          )
        ]),
      ),

    );
  }
}
