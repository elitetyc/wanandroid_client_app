import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanandroid_client_app/service/net.dart';
import 'package:wanandroid_client_app/models/index.dart' as model;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wanandroid_client_app/common/static_info.dart';
import 'package:wanandroid_client_app/common/store.dart';
import 'package:provider/provider.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with AutomaticKeepAliveClientMixin {
  List<model.Banner> _banners = [];
  List<model.Article> _articles = [];
  model.Page _page;
  int nowPage = 0;
  String loadText = "加载中...";

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeNotifier, UserInfoNotifier>(
      builder: (BuildContext context, ThemeNotifier themeNotifier,
          UserInfoNotifier user, Widget w) {
        return Scaffold(
            appBar: AppBar(
              //          取消返回按钮
              automaticallyImplyLeading: false,
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      StaticInfo.icon_fdj,
                      size: 16,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "搜索",
                      style:
                      TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            body: RefreshIndicator(
                child: CustomScrollView(
                  slivers: <Widget>[

                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
//                    color: Theme.of(context).accentColor,
                        height: 190,
                        child: Swiper(
                          autoplay: _banners.length != 0,
                          viewportFraction: 0.8,
                          scale: 0.9,
                          itemCount: _banners.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                _banners[index].imagePath,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                          pagination: new SwiperPagination(),
                          controller: new SwiperController(),
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                      if (index == _articles.length) {
//                        说明当前已经下拉到最后一个
                        nowPage +=1;
                        Future<model.Page> newpage=  getArticle(nowPage);
                        newpage.then((page){
                          setState(() {
                            _articles.addAll(page.datas);
                          });
                          if(page.over){
//                            如果是over说明已经加载完所有数据，将加载显示的字符串设置
                          setState(() {
                            loadText = "没有更多数据!";
                          });
                          }
                        });
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
                      return GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                _articles[index].niceDate,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                            ),
                            Container(
                              child: Flex(
//                  crossAxisAlignment: CrossAxisAlignment.start,
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      _articles[index].title,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.network(
                                      _articles[index].shareUser,
                                      fit: BoxFit.fill,
                                      height: 80,
                                      width: 120,
                                    ),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                              color: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              color: Colors.white,
                              child: Flex(
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
                                    _articles[index].author == ""
                                        ? "暂无作者信息"
                                        : _articles[index].author,
                                    style: TextStyle(fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  Expanded(
                                      child: Text(
                                    "分类:" +
                                        _articles[index].superChapterName +
                                        "/" +
                                        _articles[index].chapterName,
                                    style: TextStyle(fontSize: 14,color: Colors.black54),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  GestureDetector(
                                    onTap: () async {
                                      if (user.userinfo.islogin) {
                                        if (_articles[index].collect) {
//                                          说明当前是收藏了的，取消收藏
                                          int res = await unCollectArticle(
                                              _articles[index].id);
                                          if (res == 0) {
                                            setState(() {
                                              _articles[index].collect = false;
                                            });
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "取消收藏失败,请稍后再试");
                                          }
                                        } else {
//                                          说明当前未收藏
                                          int res = await collectArticle(
                                              _articles[index].id);
                                          if (res == 0) {
                                            setState(() {
                                              _articles[index].collect = true;
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
                                      _articles[index].collect
                                          ? StaticInfo.icon_fav_y
                                          : StaticInfo.icon_fav_n,
                                      size: 20,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed("webview",
                              arguments: {
                                "url": _articles[index].link,
                                "title": _articles[index].title
                              });
                        },
                      );
                    }, childCount: _articles.length + 1))
                  ],
                ),
                onRefresh: () async {
//                  下拉刷新，加载第一页数据
//                设置当前页面为第一页
                  nowPage = 0;
//                  获取新数据
                  initData();
                }));
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void initData() async {
    _banners = await getBanner();
    _page = await getArticle(0);
    _articles = _page.datas;
    setState(() {});
  }
}
