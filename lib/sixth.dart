import 'package:deego_v2/fourth.dart';
import 'package:deego_v2/main.dart';
import 'package:deego_v2/second.dart';
import 'package:flutter/material.dart';


class Sixth extends StatelessWidget {
  const Sixth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Column(
              children: [
                Text('포인트 충전화면'),
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        width: 150,
                        height: 200,
                        child: Text('~~~님 (회원일 경우) 010~~~(회원이 아닐경우) 환경멘트 감사합니다.  적립 포인트 : 00 누적 포인트 : 00'),
                      ),

                      Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        width: 150,
                        height: 200,
                        child: Text('포인트 사용 방법 앱 깔기 현금으로 환전 방법 등등'),
                      ),
                    ],
                  ),
                )
                // Text('몇 포인트 충전가능합니다\n 충전하시겠습니까?')
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
                      MaterialPageRoute(builder: (c) => MyApp()));
                }, child: Text('처음으로')),
                // ElevatedButton(onPressed: (){
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (c) => Fourth()));
                // }, child: Text('이전으로')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
