import 'package:carousel_slider/carousel_controller.dart';
import 'package:deego_v2/camera.dart';
import 'package:deego_v2/main.dart';
import 'package:deego_v2/slide.dart';
import 'package:deego_v2/third.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';



class Second extends StatefulWidget {
  late CameraDescription firstCamera;

  @override
  State<Second> createState() => _SecondState();
}


class _SecondState extends State<Second> {
@override
  void initState() {
    super.initState();
    _initializeFirstCamera(); // _initializeFirstCamera 메서드를 호출하여 firstCamera를 초기화합니다.
}

// 첫 번째 카메라를 초기화하는 메서드
void _initializeFirstCamera() async {
  final cameras = await availableCameras();
  if (cameras.isNotEmpty) {
    // 사용 가능한 카메라 목록이 비어 있지 않다면
    setState(() {
      var firstCamera = cameras.first; // 첫 번째 카메라를 firstCamera에 할당합니다.
    });
  }
}


  @override
  Widget build(BuildContext context)  {
    // final CameraDescription? firstCamera = Provider.of<CameraProvider>(context).firstCamera;
// Obtain a list of the available cameras on the device.

    var firstCamera;
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
                    child: CameraScreen()
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

