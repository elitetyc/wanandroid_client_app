import 'package:flutter/material.dart';
import 'package:wanandroid_client_app/service/net.dart';
import 'package:wanandroid_client_app/models/index.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanandroid_client_app/ui/page/projects_info.dart';

class ProjectFragment extends StatefulWidget {
  @override
  _ProjectFragmentState createState() => _ProjectFragmentState();
}

class _ProjectFragmentState extends State<ProjectFragment>
    with AutomaticKeepAliveClientMixin {
  List<Projectfl> projectfls = List<Projectfl>();

  List<List<Color>> colors = [
    [Colors.red, Colors.red[300]],
    [Colors.pink, Colors.pink[300]],
    [Colors.amber, Colors.amber[300]],
    [Colors.purple, Colors.purple[300]],
    [Colors.green, Colors.green[300]],
    [Colors.blue, Colors.blue[300]],
    [Colors.cyan, Colors.cyan[300]],
    [Colors.yellow, Colors.yellow[300]],
    [Colors.orange, Colors.orange[300]],
    [Colors.lime, Colors.lime[300]],
    [Colors.indigo, Colors.indigo[300]],
    [Colors.deepPurple, Colors.deepPurple[300]],
    [Colors.brown, Colors.brown[300]],
    [Colors.blueGrey, Colors.blueGrey[300]],
    [Colors.teal, Colors.teal[300]],
    [Colors.lightBlue, Colors.lightBlue[300]],
    [Colors.lightGreen, Colors.lightGreen[300]],
  ];
//  是否为简介模式
  bool isSimple = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text("项目分类"),
          actions: <Widget>[
            GestureDetector(
              child: Icon(Icons.swap_horiz,),
              onTap: (){
                setState(() {

                  isSimple = !isSimple;
                  if(isSimple){
                    Fluttertoast.showToast(msg: "已切换为简介模式");
                  }else{
                    Fluttertoast.showToast(msg: "已切换为花哨模式");
                  }

                });
              },
            )
          ],
        ),
        body:



        StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(20.0),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
          crossAxisCount: 4,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
//              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
//                        color: Colors.black54,
                          color: isSimple?Theme.of(context).accentColor.withAlpha(50):Colors.black.withAlpha(100),
                          offset: Offset(2.0, 2.0),
                          blurRadius: 10.0)
                    ],
                    gradient: isSimple?null:LinearGradient(
                        colors: colors[projectfls[index].order],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(projectfls[index].name,style: TextStyle(color: isSimple?Colors.black:Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectInfo(1, projectfls[index].id, projectfls[index].name)));
              },
            );
          },
          itemCount: projectfls.length,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void initData() async {
    projectfls = await getProjectFl();
    projectfls.forEach((e){
      e.order = Random().nextInt(colors.length);
    });
    setState(() {});
  }
}
