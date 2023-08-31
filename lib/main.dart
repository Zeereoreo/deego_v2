import 'package:deego_v2/homeimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //시스템 가로모드
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title:Text('deego')
      ),
      body: Container(
        child: Column(
          children: [
            ImageWidgetApp(),
            ElevatedButton(onPressed: (){}, child: Text('시작하기'))
          ],
        ),
      ),
    );
  }
}
