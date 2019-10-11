import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

    return WebviewScaffold(
      appBar: AppBar(
        title: Text(args["title"]),
      ),
      url: args["url"],
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            "加载中...",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
