import 'package:camera/camera.dart';
import 'package:deego_v2/newcamera.dart';
import 'package:deego_v2/second.dart';
import 'package:deego_v2/slide.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
// import 'package:flutter_vision/flutter_vision.dart';

class CameraProvider extends ChangeNotifier {
  CameraDescription? firstCamera;

  void setFirstCamera(CameraDescription camera) {
    firstCamera = camera;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  // FlutterVision vision = FlutterVision();
  // Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;


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


class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  const TakePictureScreen({super.key, required this.camera});

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
        widget.camera,
        ResolutionPreset.medium
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    //사용하지 않는 리소스 초기화
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: MyAppBar(),
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the Future is complete, display the preview.
              return CameraPreview(_controller);
            } else {
              // Otherwise, display a loading indicator.
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          // Provide an onPressed callback.
          onPressed: () async {
            // Take the Picture in a try / catch block. If anything goes wrong,
            // catch the error.
            try {
              // Ensure that the camera is initialized.
              await _initializeControllerFuture;

              // Attempt to take a picture and then get the location
              // where the image file is saved.
              final image = await _controller.takePicture();
            } catch (e) {
              // If an error occurs, log the error to the console.
              print(e);
            }
          },
          child: const Icon(Icons.camera_alt),
        )

    );
  }
}

