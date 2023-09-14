import 'package:camera/camera.dart';
import 'package:deego_v2/photo_preview.dart';
import 'package:flutter/material.dart';
import 'package:aws_s3_upload/aws_s3_upload.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  bool _isCameraReady = false;


  @override
  void initState() {
    super.initState();


    availableCameras().then((cameras) {
      if (cameras.isNotEmpty && _cameraController == null) {
        _cameraController = CameraController(
          cameras.first,
          ResolutionPreset.medium,
        );

        _cameraController!.initialize().then((_) {
          setState(() {
            _isCameraReady = true;
          });
        });
      }
    });
  }

  void _onTakePicture(BuildContext context) {
    _cameraController!.takePicture().then((image) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PhotoPreview(
            imagePath: image.path,
          ),
        ),
      );
      uploadPicture(image.path);
    });
  }
  void uploadPicture(String imagePath) {

      String? awsKey = dotenv.env['AWS_KEY'];
      String? awsSecret = dotenv.env['AWS_SECRET'];

      if (awsKey != null && awsSecret != null) {
        AwsS3.uploadFile(
            accessKey: awsKey,
            secretKey: awsSecret,
            file: File(imagePath),
            bucket: "deego-v2-dev", // 업로드할 S3 버킷 이름
            region: "ap-northeast-2",   // AWS 지역 설정
            metadata: {"test": "test"} // 선택 사항
        ).then((result) async {
          // 업로드 완료 후 실행할 코드
          http.Response response = await http.post(Uri.parse('http://ai.deegolabs.com:9999/detect/'),
            headers: {
              'Authorization' : 'Bearer mydeego'
            },
            body: { "key" : "point/2.jpg" }
          );

          print(response);
          print(result);

        }).catchError((error) {
          // 업로드 중 오류 발생 시 실행할 코드
        });
      } else {
        // AWS 키가 null인 경우 처리할 코드
      }

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: _cameraController != null && _isCameraReady
                ? CameraPreview(_cameraController!)
                : Container(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: _cameraController != null
                  ? () => _onTakePicture(context)
                  : null,
              child: const Text('Take a photo'),
            ),
          ),
        ],
      ),
    );
  }
}
