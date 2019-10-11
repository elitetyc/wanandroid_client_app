import 'package:flutter/material.dart';
import 'package:wanandroid_client_app/service/net.dart';
import 'package:wanandroid_client_app/models/index.dart';
import 'dart:math';
import 'package:wanandroid_client_app/common/store.dart';
import 'package:wanandroid_client_app/ui/page/projects_info.dart';

class GroundFragment extends StatefulWidget {
  @override
  _GroundFragmentState createState() => _GroundFragmentState();
}

class _GroundFragmentState extends State<GroundFragment>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _titleTabController;
  PageController _centerPageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        _centerPageController.jumpToPage(_titleTabController.index);
      });
    _centerPageController = PageController()
      ..addListener(() {
        _titleTabController.offset = _centerPageController.page;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: TabBar(
              tabs: [
                Tab(text: "体系数据"),
                Tab(text: "导航数据"),
              ],
//              设置可滑动
              controller: _titleTabController,
              labelColor: Theme.of(context).accentColor,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          Expanded(
              child: PageView(
            children: <Widget>[TxDataView(), DhDataView()],
            controller: _centerPageController,
          ))
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class TxDataView extends StatefulWidget {
  @override
  _TxDataViewState createState() => _TxDataViewState();
}

class _TxDataViewState extends State<TxDataView>
    with AutomaticKeepAliveClientMixin {
  List<Txouter> txouters = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  txouters[index].name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 8.0,
                  children: tags(txouters[index]),
                )
              ],
            ),
          );
        },
        itemCount: txouters.length,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void initData() async {
    txouters = await getTreeJson();
    txouters.forEach((e) {
      e.order = Random().nextInt(themeColors.length);
    });
    setState(() {});
  }

  List<Widget> tags(Txouter txouter) {
    List<Widget> children = [];
    txouter.children.forEach((e) {
      children.add(GestureDetector(
        child: new Chip(
          avatar: new CircleAvatar(
              backgroundColor: themeColors[txouter.order],
              child: Text(e.name.substring(0, 1))),
          label: new Text(e.name),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectInfo(0, e.id, e.name)));

        },
      ));
    });

    return children;
  }
}

class DhDataView extends StatefulWidget {
  @override
  _DhDataViewState createState() => _DhDataViewState();
}

class _DhDataViewState extends State<DhDataView>
    with AutomaticKeepAliveClientMixin {
  List<Navouter> navouters = List<Navouter>();

  int nowcheckIndex = 0;
  ScrollController leftController;
  ScrollController rightController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leftController = ScrollController()..addListener(() {});
    rightController = ScrollController()
      ..addListener(() {
//          leftController.animateTo(rightController.offset, duration: Duration(milliseconds: 200), curve: Curves.ease);
      });
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return nowcheckIndex == index
                  ? GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color: Theme.of(context).accentColor),
                                right: BorderSide(color: Colors.grey))),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        child: Center(
                          child: Text(
                            navouters[index].name,
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          nowcheckIndex = index;
                        });
                      },
                    )
                  : GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(100),
                            border: Border(
                                bottom: BorderSide(color: Colors.grey),
                                right: BorderSide(color: Colors.grey))),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        child: Center(
                          child: Text(navouters[index].name),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          nowcheckIndex = index;
                        });
                      },
                    );
            },
            itemCount: navouters.length,
            controller: leftController,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      navouters[index].name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: tags(navouters[index]),
                    )
                  ],
                ),
              );
            },
            itemCount: navouters.length,
            controller: rightController,
          ),
          flex: 3,
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void initData() async {
    navouters = await getNavJson();
//    使用数据的zan字段来保存颜色的下标，防止在setstate时，会重新调用random颜色会改变
    navouters.forEach((e) {
      e.articles.forEach((e1) {
        e1.zan = Random().nextInt(themeColors.length);
      });
    });
    setState(() {});
  }

  List<Widget> tags(Navouter navouter) {
    List<Widget> children = [];
    navouter.articles.forEach((e) {
      Color color = themeColors[e.zan];
      children.add(GestureDetector(
        child: new Chip(
          label: new Text(
            e.title,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed("webview",
              arguments: {"url": e.link, "title": e.title});
        },
      )
      );
    });
    return children;
  }
}
