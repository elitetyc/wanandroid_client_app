import 'package:flutter/material.dart';

class ImageDialog extends StatefulWidget {
  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

    return Container(
      child: GestureDetector(
        child: Image.network(args["img"],fit: BoxFit.fill,),
        onTap: (){
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
