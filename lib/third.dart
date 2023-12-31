import 'package:deego_v2/fourth.dart';
import 'package:deego_v2/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:deego_v2/main.dart';



class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body:
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                MyLoadingScreen(),
                Align(
                  alignment: Alignment.bottomCenter,
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
          ),
    );
  }
}

class MyLoadingScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
          body: Center(
                    child: SpinKitWave(
                    color: Color(0xFF49BCF8), // 색상 설정
                    size: 50.0, // 크기 설정
                    duration: Duration(seconds: 2), //속도 설정
                  ),
              ),
           );
}
}