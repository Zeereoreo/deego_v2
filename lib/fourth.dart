import 'package:deego_v2/fifth.dart';
import 'package:deego_v2/main.dart';
import 'package:deego_v2/third.dart';
import 'package:flutter/material.dart';


class Fourth extends StatelessWidget {
  const Fourth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Column(
              children: [
                Text('결과 인지 화면\n 몇 포인트 충전가능합니다\n 충전하시겠습니까?'),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                          child: Text('결과에 따른 이미지'),
                        ),
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
                      MaterialPageRoute(builder: (c) => Fifth()));
                }, child: Text('다음으로')),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => Third()));
                }, child: Text('이전으로')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
