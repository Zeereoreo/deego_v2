import 'package:carousel_slider/carousel_controller.dart';
import 'package:deego_v2/main.dart';
import 'package:deego_v2/slide.dart';
import 'package:deego_v2/third.dart';
import 'package:flutter/material.dart';



class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFF49BCF8),
                                width: 5,
                            ),
                            borderRadius: BorderRadius.circular(70),
                        ),
                        width: 150,
                        height: 250,
                        alignment: Alignment.center,
                        child: Text('Step 1 \n 포켓에 맞춰 넣어주세요'),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF49BCF8),
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(70),
                        ),
                        width: 150,
                        height: 250,
                        alignment: Alignment.center,
                        child: Text('Step 2 \n 들어가면 안되는 것들'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF49BCF8),
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(70),
                        ),
                        width: 150,
                        height: 250,
                        alignment: Alignment.center,
                        child: Text('Step 3 \n 투입 완료 버튼을 눌러주세요'),
                      )
                    ],
                  ),
                )
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
                      MaterialPageRoute(builder: (c) => Third()));
                }, child: Text('다음으로')),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => MyApp()));
                }, child: Text('이전으로')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
