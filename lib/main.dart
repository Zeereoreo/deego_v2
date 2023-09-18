import 'package:camera/camera.dart';
import 'package:deego_v2/second.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_vision/flutter_vision.dart';

class CameraProvider extends ChangeNotifier {
  CameraDescription? firstCamera;

  void setFirstCamera(CameraDescription camera) {
    firstCamera = camera;
  }
}

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  HttpOverrides.global = MyHttpOverrides();
  // FlutterVision vision = FlutterVision();
  // Ensure that plugin services are initialized so that `availableCameras()`


  runApp(
      ChangeNotifierProvider(
          create: (c) => CameraProvider(),
          child: MaterialApp(
              home: HomePage()
          )
      )
  );
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){

    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Deego App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {

  const HomePage({Key? key }) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


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
              Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => Second()
                  )
              );
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

