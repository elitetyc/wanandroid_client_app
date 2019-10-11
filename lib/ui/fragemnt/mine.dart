import 'package:flutter/material.dart';
import 'package:wanandroid_client_app/common/store.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid_client_app/common/static_info.dart';
import 'dart:math';
import 'package:wanandroid_client_app/models/userinfo.dart';

class MineFragment extends StatefulWidget {
  @override
  _MineFragmentState createState() => _MineFragmentState();
}

class _MineFragmentState extends State<MineFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeNotifier,UserInfoNotifier>(
      builder: (BuildContext context,ThemeNotifier themeNotifier,UserInfoNotifier userInfoNotifier,Widget child){
        return Scaffold(
          appBar: AppBar(
            title: Text("个人中心"),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                color: Colors.white,
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(StaticInfo.manIcon.replaceAll("Index",7.toString()),fit: BoxFit.fill,height: 50,width: 50,),
                    ),
                    SizedBox(width: 10,),
                    Expanded(child: Text(userInfoNotifier.userinfo.islogin?userInfoNotifier.userinfo.username:"点击登录",
                      style: TextStyle(fontSize: 18),),),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                color: Colors.white,
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Icon(StaticInfo.icon_update_info,color: Theme.of(context).accentColor,size: 20,),
                    SizedBox(width: 10,),
                    Expanded(child: Text("完善信息",
                      style: TextStyle(fontSize: 14),),),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey.withAlpha(50),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                color: Colors.white,
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Icon(StaticInfo.icon_update_pwd,color: Theme.of(context).accentColor,size: 20,),
                    SizedBox(width: 10,),
                    Expanded(child: Text("修改密码",
                      style: TextStyle(fontSize: 14),),),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey.withAlpha(50),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                  color: Colors.white,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Icon(StaticInfo.icon_theme_set,color: Theme.of(context).accentColor,size: 20,),
                      SizedBox(width: 10,),
                      Expanded(child: Text("修改主题",
                        style: TextStyle(fontSize: 14),),),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                onTap: (){
                  showDialog(context: context,
                  builder: (BuildContext context){
                    return Dialog(
                      child: Container(
                        height: 30.0*themeColors.length,
                        child: ListView.builder(itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              color: themeColors[index],
                              height: 30,
                            ),
                            onTap: (){
                              themeNotifier.setThemeColor = themeColors[index];
                              Navigator.of(context).pop();
                            },
                          );
                        },
//                          itemExtent: 30,
                          itemCount: themeColors.length,),
                      ),
                    );
                  });
                },
              ),
              Container(
                height: 1,
                color: Colors.grey.withAlpha(50),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                  color: Colors.white,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Icon(StaticInfo.icon_exit,color: Theme.of(context).accentColor,size: 20,),
                      SizedBox(width: 10,),
                      Expanded(child: Text("退出登录",
                        style: TextStyle(fontSize: 14),),),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                onTap: (){
                  Userinfo userinfo = Userinfo();
                  userinfo.username="";
                  userinfo.islogin = false;
                  userinfo.pwd = "";
                  userInfoNotifier.setUserinfo=userinfo;
                  Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => route == null,);
                },
              )
            ],
          ),
        );
      },
    );
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
