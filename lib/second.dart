import 'package:carousel_slider/carousel_controller.dart';
import 'package:deego_v2/camera.dart';
import 'package:deego_v2/main.dart';
import 'package:deego_v2/slide.dart';
import 'package:deego_v2/third.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';



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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF49BCF8).withAlpha(70)
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height/1.5,
            decoration: BoxDecoration(

              border: Border.all(
                width: 5,
                color: Color(0xFF49BCF8),
              ),
              borderRadius: BorderRadius.circular(20)

            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Color(0xFF49BCF8),
                          width: 5,
                        ),
                      ),
                      color: Colors.white
                    ),
                    child: Text('1st step'),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Color(0xFF49BCF8),
                            width: 5,
                          ),
                        ),
                        color: Colors.white
                    ),
                    child: CameraScreen(),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Text('3rd step'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
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
            ),
          )
        ],
      ),
    );
  }
}