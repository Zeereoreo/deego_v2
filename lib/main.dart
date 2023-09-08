import 'package:deego_v2/second.dart';
import 'package:deego_v2/slide.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<String> imageList = [
    'assets/images/Group5.png',
    'assets/images/Group6.png',
    'assets/images/Group4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Image.asset('assets/images/deegologo.png', fit: BoxFit.cover),
      ),
      body: Column(
        children: [
          SizedBox(
            // height: 300,
            child: Stack(
              children: [
                Image.asset('assets/images/deegoback.jpg')

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Image.asset('assets/images/deegologo.png', fit: BoxFit.cover),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

