import 'package:deego_v2/fourth.dart';
import 'package:deego_v2/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Text('로딩 화면'),
                MyLoadingScreen(),
                // sliderWidget(),
                // sliderIndicator(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => Fourth()));
                }, child: Text('다음으로')),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => Second()));
                }, child: Text('이전으로')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyLoadingScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
//로딩바 구현 부분
child: SpinKitWave(
color: Color(0xFF49BCF8), // 색상 설정
size: 50.0, // 크기 설정
duration: Duration(seconds: 2), //속도 설정
),
),
);
}
}