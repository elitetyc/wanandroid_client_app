import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wanandroid_client_app/common/static_info.dart';
import 'package:wanandroid_client_app/service/net.dart';
import 'package:dio/dio.dart';
import 'package:wanandroid_client_app/models/BaseResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanandroid_client_app/common/store.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid_client_app/models/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool canClick = false;
  String username = "", pwd = "";

  TextEditingController _usernameController;
  TextEditingController _pwdController;


  @override
  void initState() {
    _usernameController = TextEditingController()..addListener((){
      username  = _usernameController.text.trim();
    });
    _pwdController = TextEditingController()..addListener((){
      pwd = _pwdController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeNotifier,UserInfoNotifier>(
      builder: (BuildContext context,ThemeNotifier t1,UserInfoNotifier u1,Widget child){
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.grey,
                    ),
                    onTap: (){
//                      退出应用
                      exit(0);
                    },
                  ),
                ),
                Text(
                  "账号密码登录",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _usernameController,
                  onChanged: (v) {
                    username = v.trim();
                    if (username == "" || pwd == "") {
                      setState(() {
                        canClick = false;
                      });
                    } else {
                      setState(() {
                        canClick = true;
                      });
                    }
                  },
                  decoration:
                  InputDecoration(hintText: "请输入账号", border: InputBorder.none),
                ),
                TextField(
                  controller: _pwdController,
                  onChanged: (v) {
                    pwd = v.trim();
                    if (username == "" || pwd == "") {
                      setState(() {
                        canClick = false;
                      });
                    } else {
                      setState(() {
                        canClick = true;
                      });
                    }
                  },
                  decoration:
                  InputDecoration(hintText: "请输入密码", border: InputBorder.none),
//        隐藏输入的内容
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                FlatButton(
                  onPressed: clickLogin(u1),
                  child: Container(
                    alignment: Alignment.center,
                    width: 600,
                    height: 45,
                    child: Text(
                      "登录",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  disabledColor: Theme.of(context).accentColor.withAlpha(200),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "登录遇到问题?",
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 1,
                      color: Colors.grey,
                      height: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "忘记密码",
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: 30,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "社交账号登录",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: 30,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    StaticInfo.icon_wechat,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "微信",
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                  )
                                ],
                              )),
                          Expanded(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    StaticInfo.icon_qq,
                                    color: Colors.lightBlue,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "QQ",
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                  )
                                ],
                              )),
                          Expanded(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    StaticInfo.icon_weibo,
                                    color: Colors.deepOrangeAccent,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "微博",
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                  )
                                ],
                              )),
                          Expanded(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    StaticInfo.icon_more,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  Text(
                                    "更多",
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                  text: "登录即代表您已经同意",
                                  style: TextStyle(
                                      fontSize: 12,color: Colors.grey
                                  )
                              ),
                              TextSpan(
                                  text: "用户协议",
                                  style: TextStyle(
                                      fontSize: 12,color: Colors.green,
                                      decoration: TextDecoration.underline
                                  )
                              ),
                              TextSpan(
                                  text: " 和 ",
                                  style: TextStyle(
                                      fontSize: 12,color: Colors.grey
                                  )
                              ),
                              TextSpan(
                                text: "隐私政策",
                                style: TextStyle(
                                    fontSize: 12,color: Colors.green,
                                    decoration: TextDecoration.underline
                                ),

                              )
                            ]
                        )
                    )
                  ],
                ),

              ],
            ),
          ),
        );
      },
    );
  }



//  点击了登录按钮
  clickLogin(UserInfoNotifier u1) {
    if (canClick) {
      return () async{
        BaseResponse baseResponse = await mylogin(username, pwd);
        if(baseResponse.errorCode==0){
//          账号密码正确
//          Fluttertoast.showToast(msg: "账号密码正确");
          Userinfo userinfo = Userinfo();
          userinfo.username = username;
          userinfo.pwd = pwd;
          userinfo.islogin = true;
          u1.setUserinfo = userinfo;
          Navigator.of(context).pushNamedAndRemoveUntil("main", (route) => route == null,);
        }else{
          Fluttertoast.showToast(msg: baseResponse.errorMsg);
        }
      };
    }
//    返回null表示禁用会显示浅色
    return null;
  }
}
