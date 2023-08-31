import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageWidgetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _ImageWidgetApp();
  }
}

class _ImageWidgetApp extends State<ImageWidgetApp>{
  @override
  Widget build(BuildContext context){
    return  Container(
      child: Image.asset('image/new.jpg'),
    );
  }
}