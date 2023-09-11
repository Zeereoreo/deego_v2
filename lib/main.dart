import 'package:deego_v2/second.dart';
import 'package:deego_v2/slide.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;


void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
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
  // int _current = 0;
  // final CarouselController _controller = CarouselController();
  //
  // List<String> imageList = [
  //   'assets/images/Group5.png',
  //   'assets/images/Group6.png',
  //   'assets/images/Group4.png',
  // ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Image.asset('assets/images/deegologo.png', fit: BoxFit.cover),
      ),
      body: Stack(
      children: [
      Container(
        decoration: BoxDecoration(
          image:  DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/deegoback.jpg')
          )
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF49BCF8),
              minimumSize: Size(150, 150),
              shape: CircleBorder(side: BorderSide()),
              // elevation:
            ),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => Second()));
            },
            child: Text('다음으로'),
        ),
      )
    ],
    )
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

