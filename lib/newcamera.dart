// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
//
// // 사용 가능한 카메라 목록을 가져옴
// List<CameraDescription> cameras = [];
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras = await availableCameras();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     if (cameras.isEmpty) {
//       return MaterialApp(
//         home: Scaffold(
//           body: Center(
//             child: Text('No cameras available'),
//           ),
//         ),
//       );
//     }
//
//     return MaterialApp(
//       home: CameraScreen(cameras[0]), // 첫 번째 카메라 사용
//     );
//   }
// }
