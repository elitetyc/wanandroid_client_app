import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid_client_app/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';



class Store{

  static String cookiePath;

  static Profile profile;
  static ColorSwatch themeColor;
  static SharedPreferences sharedPreferences;

  static dynamic init({context,child}) async{
//    初始化获取本地数据
    sharedPreferences = await SharedPreferences.getInstance();
//    获取cookie保存的目录
    Directory tempDir = await getTemporaryDirectory();
    cookiePath = tempDir.path;
    print(cookiePath);
    if(sharedPreferences.get("profile")==null){
//      说明本地没有存储数据
      profile  = Profile();
      Userinfo userInfo = Userinfo();
      userInfo.username="";
      userInfo.pwd="";
      userInfo.islogin = false;
      profile.userinfo = userInfo;
      Mytheme mytheme = Mytheme();
      mytheme.themecolor = themeColors[0].value;
      themeColor = themeColors[0];
      profile.theme = mytheme;
      save();
    }else{
      profile = Profile.fromJson(jsonDecode(sharedPreferences.get("profile")));
    }
    print("初始化数据为");
    print(jsonDecode(sharedPreferences.get("profile")));
//    根据themecolor判断当前是哪一个color
    for(int i=0;i<themeColors.length;i++){
      if(themeColors[i].value==profile.theme.themecolor){
        themeColor = themeColors[i];
        break;
      }
    }
//    return MultiProvider(
//        providers: [
//          ChangeNotifierProvider(
//            builder: (_)=>UserInfoNotifier(),
//          ),
//          ChangeNotifierProvider(
//            builder: (_)=>ThemeNotifier(),
//          )
//        ],
//        child: child,
//    );
  }

  //保存数据到本地
  static save(){
    sharedPreferences.setString("profile", jsonEncode(profile.toJson()));
  }
}


class ProfileNotifier with ChangeNotifier{
  Profile get profile => Store.profile;

  @override
  void notifyListeners() {
    Store.save();
    super.notifyListeners();
  }
}


class UserInfoNotifier extends ProfileNotifier{
  Userinfo get userinfo => profile.userinfo;

  set setUserinfo(newuserinfo){
    profile.userinfo = newuserinfo;
    notifyListeners();
  }


}

const List<ColorSwatch> themeColors = [
  Colors.blue,
  Colors.deepOrange,
  Colors.green,
  Colors.purple,
  Colors.pink,
  Colors.amber

];

class ThemeNotifier extends ProfileNotifier{
  ColorSwatch get themecolor =>Store.themeColor;

  set setThemeColor(ColorSwatch newcolor){

    Store.themeColor = newcolor;
    profile.theme.themecolor = Store.themeColor.value;
    notifyListeners();
  }



}
