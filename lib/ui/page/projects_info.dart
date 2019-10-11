import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanandroid_client_app/common/static_info.dart';
import 'package:wanandroid_client_app/models/index.dart';
import 'package:wanandroid_client_app/service/net.dart';
import 'package:provider/provider.dart';
import 'package:wanandroid_client_app/common/store.dart';

class ProjectInfo extends StatefulWidget {
  int type = 0;
  String title = "暂无标题";
  int cid = 0;

  ProjectInfo(this.type, this.cid, this.title);

  @override
  _ProjectInfoState createState() => _ProjectInfoState(type, title, cid);
}

class _ProjectInfoState extends State<ProjectInfo> {
  _ProjectInfoState(this.type, this.title, this.cid);

//  当前的类型，为0时表示是体系，为1时表示是项目，为2时表示公众号
  int type = 0;
  String title = "暂无标题";
  int cid = 0;
  List<ProjectAllOuterChild> projectList = [];
  int nowPage = 0;
  String loadText = "数据加载中...";
  bool canload = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    因为不同类型的起始页面不一样，体系数据起始页为0，项目起始页为1，公众号起始页为1
    if(type==0)
      nowPage =0;
    else
      nowPage = 1;
    getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeNotifier,UserInfoNotifier>(
      builder: (BuildContext context,ThemeNotifier themeNotifier,UserInfoNotifier user,Widget child){
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                title: Text(title),
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    type == 0 ? StaticInfo.type0 : StaticInfo.type1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SliverList(
                  delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                    if(index==projectList.length){
                      if(canload){
                        //                      说明加载到最底部，显示加载中
                        nowPage+=1;
                        Future<List<ProjectAllOuterChild>> newdata;
                        if(type==0){
                          newdata = getTixiList(nowPage, cid);
                        }else if(type==1){
                          newdata = getProjectList(nowPage, cid);
                        }else if(type==2){
                          newdata = getGzhList(nowPage, cid);
                        }
                        newdata.then((page){
                          if(page.length==0){
                            setState(() {
                              loadText="暂无更多数据";
                            });
                            canload = false;
                          }else{
                            setState(() {
                              projectList.addAll(page);
                            });
                          }
                        });
                      }
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            loadText,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );


                    }
                    if (type == 0) {
                      return GestureDetector(
                        child: Card(
                          margin:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  projectList[index].title,
                                  style: TextStyle(color: Colors.black, fontSize: 18),
                                ),
                                SizedBox(height: 10,),
                                Flex(
                                  direction: Axis.horizontal,
                                  children: <Widget>[
                                    Icon(
                                      StaticInfo.icon_author,
                                      color: Theme.of(context).accentColor,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                        child: Text(
                                          projectList[index].author == ""
                                              ? "暂无作者信息"
                                              : projectList[index].author,
                                          style: TextStyle(fontSize: 14),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Expanded(
                                        child: Text(
                                          "分类:" +
                                              projectList[index].superChapterName +
                                              "/" +
                                              projectList[index].chapterName,
                                          style: TextStyle(fontSize: 14,color: Colors.black54),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    GestureDetector(
                                      onTap: () async {
                                        if (user.userinfo.islogin) {
                                          if (projectList[index].collect) {
//                                          说明当前是收藏了的，取消收藏
                                            int res = await unCollectArticle(
                                                projectList[index].id);
                                            if (res == 0) {
                                              setState(() {
                                                projectList[index].collect = false;
                                              });
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "取消收藏失败,请稍后再试");
                                            }
                                          } else {
//                                          说明当前未收藏
                                            int res = await collectArticle(
                                                projectList[index].id);
                                            if (res == 0) {
                                              setState(() {
                                                projectList[index].collect = true;
                                              });
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "收藏失败,请稍后再试");
                                            }
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "请先登录再进行操作");
                                        }
                                      },
                                      child: Icon(
                                        projectList[index].collect
                                            ? StaticInfo.icon_fav_y
                                            : StaticInfo.icon_fav_n,
                                        size: 20,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                          onTap: (){
                            Navigator.of(context).pushNamed("webview",
                                arguments: {
                                  "url": projectList[index].link,
                                  "title": projectList[index].title
                                });
                          }
                      );


//              return Text("tyc1");
                    } else if (type == 1) {
                      return GestureDetector(
                        child: Card(
                          margin:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flex(direction: Axis.horizontal,
                                  children: <Widget>[
                                    GestureDetector(
                                      child: ClipRRect(
                                          child: Image.network(projectList[index].envelopePic,fit: BoxFit.fill,width: 50,height: 80,),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      onTap: (){
                                        Navigator.of(context).pushNamed( "imageDialog",arguments: {"img":projectList[index].envelopePic});
                                      },
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text(
                                      projectList[index].title,
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    ),)
                                  ],),
                                SizedBox(height: 10,),
                                Flex(
                                  direction: Axis.horizontal,
                                  children: <Widget>[
                                    Icon(
                                      StaticInfo.icon_author,
                                      color: Theme.of(context).accentColor,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5,),
                                    Expanded(
                                        child: Text(
                                          projectList[index].author == ""
                                              ? "暂无作者信息"
                                              : projectList[index].author,
                                          style: TextStyle(fontSize: 14),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Expanded(
                                        child: Text(
                                          "分类:" +
                                              projectList[index].superChapterName +
                                              "/" +
                                              projectList[index].chapterName,
                                          style: TextStyle(fontSize: 14,color: Colors.black54),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    GestureDetector(
                                      onTap: () async {
                                        if (user.userinfo.islogin) {
                                          if (projectList[index].collect) {
//                                          说明当前是收藏了的，取消收藏
                                            int res = await unCollectArticle(
                                                projectList[index].id);
                                            if (res == 0) {
                                              setState(() {
                                                projectList[index].collect = false;
                                              });
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "取消收藏失败,请稍后再试");
                                            }
                                          } else {
//                                          说明当前未收藏
                                            int res = await collectArticle(
                                                projectList[index].id);
                                            if (res == 0) {
                                              setState(() {
                                                projectList[index].collect = true;
                                              });
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "收藏失败,请稍后再试");
                                            }
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "请先登录再进行操作");
                                        }
                                      },
                                      child: Icon(
                                        projectList[index].collect
                                            ? StaticInfo.icon_fav_y
                                            : StaticInfo.icon_fav_n,
                                        size: 20,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pushNamed("webview",
                              arguments: {
                                "url": projectList[index].link,
                                "title": projectList[index].title
                              });
                        },
                      );
                    }else if (type == 2) {
                      return GestureDetector(
                          child: Card(
                            margin:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    projectList[index].title,
                                    style: TextStyle(color: Colors.black, fontSize: 18),
                                  ),
                                  SizedBox(height: 10,),
                                  Flex(
                                    direction: Axis.horizontal,
                                    children: <Widget>[

                                      Expanded(
                                          child: Text(
                                            "时间:" +
                                                projectList[index].niceDate ,
                                            style: TextStyle(fontSize: 14,color: Colors.black54),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      GestureDetector(
                                        onTap: () async {
                                          if (user.userinfo.islogin) {
                                            if (projectList[index].collect) {
//                                          说明当前是收藏了的，取消收藏
                                              int res = await unCollectArticle(
                                                  projectList[index].id);
                                              if (res == 0) {
                                                setState(() {
                                                  projectList[index].collect = false;
                                                });
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: "取消收藏失败,请稍后再试");
                                              }
                                            } else {
//                                          说明当前未收藏
                                              int res = await collectArticle(
                                                  projectList[index].id);
                                              if (res == 0) {
                                                setState(() {
                                                  projectList[index].collect = true;
                                                });
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: "收藏失败,请稍后再试");
                                              }
                                            }
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "请先登录再进行操作");
                                          }
                                        },
                                        child: Icon(
                                          projectList[index].collect
                                              ? StaticInfo.icon_fav_y
                                              : StaticInfo.icon_fav_n,
                                          size: 20,
                                          color: Theme.of(context).accentColor,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushNamed("webview",
                                arguments: {
                                  "url": projectList[index].link,
                                  "title": projectList[index].title
                                });
                          }
                      );


//              return Text("tyc1");
                    }
                    else {
                      return Text("你好");
                    }
                  }, childCount: projectList.length+1))
            ],
          ),
        );
      },
    );
  }

  void getDatas() async {
    if (type == 0) {
      projectList = await getTixiList(nowPage, cid);
    } else if (type == 1) {
      projectList = await getProjectList(nowPage, cid);
    }else if(type==2){
      projectList = await getGzhList(nowPage, cid);
    }
    setState(() {});
  }
}
