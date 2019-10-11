import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wanandroid_client_app/service/net.dart';
import 'package:wanandroid_client_app/models/index.dart';
import 'dart:math';
import 'package:wanandroid_client_app/ui/page/projects_info.dart';

class GzhFragment extends StatefulWidget {
  @override
  _GzhFragmentState createState() => _GzhFragmentState();
}

class _GzhFragmentState extends State<GzhFragment> with AutomaticKeepAliveClientMixin{

  List<GzhChild> gzhchilds = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("公众号"),
      ),
      body: Container(
        color: Color(0xfff6f6f6),
        child: ListView.builder(itemBuilder: (context,index){
          return
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text(gzhchilds[index].name,style: TextStyle(color: Colors.black.withAlpha(200),fontSize: 16),),
                  Container(
                    child: Flex(direction: Axis.horizontal,children: <Widget>[
                      Expanded(child: Center(
                        child: null,
                      ),flex: 2,),
                      Expanded(child: Container(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Positioned(child: GestureDetector(
                              child: Container(

                                child: Text("点击关注",style: TextStyle(color: Colors.white,fontSize: 12),),
                                padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor.withAlpha(220),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),

                                ),
                              ),
                              onTap: (){
                                ClipboardData data = new ClipboardData(text:gzhchilds[index].name);
                                Clipboard.setData(data);
                                Fluttertoast.showToast(
                                    msg: "公众号已复制到剪切板，快去微信公众号关注吧!");
                              },
                            ))
                          ],
                        ),
                      ))
                    ],),
                  ),
                ],
              ),),
            onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectInfo(2, gzhchilds[index].id, gzhchilds[index].name)));
          },
          );

//          return Container(
//            margin: EdgeInsets.symmetric(vertical: 10),
//            color: Colors.white,
//            child: Flex(direction: Axis.horizontal,children: <Widget>[
//              Expanded(child: Stack(
//                alignment: Alignment.center,
//                children: <Widget>[
//                  CustomPaint(
//                    size: Size(MediaQuery.of(context).size.width*2/3, 60),
//                    painter: MyCustomPainter(Theme.of(context).accentColor),
//                  ),
//                  Positioned(child: Text(gzhchilds[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),left: MediaQuery.of(context).size.width*2/12,)
//                ],
//              ),flex: 2,),
//              Expanded(child: Container(
//                height: 60,
//                child: Stack(
//                  alignment: Alignment.bottomCenter,
//                  children: <Widget>[
//                    Positioned(child: Container(
//
//                      child: Text("点击关注",style: TextStyle(color: Colors.white),),
//                      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
//                      decoration: BoxDecoration(
//                          color: Theme.of(context).accentColor,
//                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
//                          boxShadow: [
//                            BoxShadow(
//                                color:Theme.of(context).accentColor.withAlpha(150),
//                                offset: Offset(2.0,2.0),
//                                blurRadius: 5.0,
//                                spreadRadius: 1.0
//                            )
//                          ]
//                      ),
//                    ))
//                  ],
//                ),
//              ))
//            ],),
//          );
        },itemCount: gzhchilds.length,),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void getData() async{
    gzhchilds = await getGzh();
    setState(() {
      
    });
  }
}
class MyCustomPainter extends CustomPainter{
  Color paintColor = Colors.blue;
  MyCustomPainter(this.paintColor);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = paintColor;

//    整个条的长度
    double leftWidth = size.width;
//    三角形三边的长度
    double sbian = size.height*2/sqrt(3);
//    长方形的长度
    double rectWidth = leftWidth-sbian/2.0;

//    画长方形
  canvas.drawRect(Rect.fromLTRB(0, 0, rectWidth, size.height), paint);
//  画圆弧
  canvas.drawArc(Rect.fromLTRB(leftWidth-sbian*2, -sbian, leftWidth, sbian), 0, pi/180*60, true, paint);




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
