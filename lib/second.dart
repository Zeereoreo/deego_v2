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
  List<String> imageList = [
    "https://cdn.pixabay.com/photo/2014/04/14/20/11/pink-324175_1280.jpg",
    "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_1280.jpg",
    "https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg",
    "https://cdn.pixabay.com/photo/2015/06/19/20/13/sunset-815270_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/01/08/05/24/sunflower-1127174_1280.jpg",
  ];
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
                Text('두번째 페이지'),
                ImageSliderWidget(
                  controller: _controller,
                  imageList: imageList,
                  currentIndex: _current,
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
