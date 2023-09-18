import 'package:camera/camera.dart';
import 'package:deego_v2/photo_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aws_s3_upload/aws_s3_upload.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';


class CameraScreen extends StatefulWidget {

  const CameraScreen({super.key});
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화


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


  void uploadPicture(_image) async {
    String? awsKey = dotenv.env['AWS_KEY'];
    String? awsSecret = dotenv.env['AWS_SECRET'];
    if (awsKey != null && awsSecret != null) {
      try {
        final result = await AwsS3.uploadFile(
          accessKey: awsKey,
          secretKey: awsSecret,
          file: File(_image), // 이제 File 인스턴스를 전달합니다.
          bucket: "deego-v2-dev",
          region: "ap-northeast-2",
        );
        print('이미지 경로:'+ File(_image).toString());

        print('결과 값:'+ result.toString());
        // 업로드 결과 문자열을 확인하여 성공 또는 실패 여부를 판단합니다.
        if (result == "Success") {
          //   final response = await http.post(
          //     Uri.parse('http://ai.deegolabs.com:9999/detect/'),
          //     headers: {
          //       'Authorization': 'Bearer mydeego',
          //     },
          //     body: {
          //       "key": _image,
          //       // 추가 데이터를 여기에 포함할 수 있습니다.
          //     },
          //   );
          //
          //   if (response.statusCode == 200) {
          //     print("AI 서버 응답: ${response.body}");
          //   } else {
          //     print("AI 서버 요청 실패: ${response.statusCode}");
          //   }

        }
        else {
          print("S3 업로드 실패: $result");
        }
      } catch (error) {
        print("오류 발생: $error");
      }
    } else {
      // AWS 키가 null인 경우 처리할 코드
      print("AWS 키가 설정되지 않았습니다.");
    }
  }


  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    uploadPicture(_image);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }
  Widget _buildPhotoArea() {
    return _image != null
        ? Container(
      width: 300,
      height: 300,
      child: Image.file(File(_image!.path)), //가져온 이미지를 화면에 띄워주는 코드
    )
        : Container(
      width: 300,
      height: 300,
      color: Colors.grey,
    );
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
              onPressed: (){
                getImage(ImageSource.camera);
              },
              child: const Text('Take a photo'),
            ),
          ),
          ElevatedButton(onPressed: (){

          }, child: Text('Test'))
        ],
      ),
    );
  }
}

