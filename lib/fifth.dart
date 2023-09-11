import 'package:deego_v2/fourth.dart';
import 'package:deego_v2/main.dart';
import 'package:deego_v2/second.dart';
import 'package:deego_v2/sixth.dart';
import 'package:flutter/material.dart';

class Fifth extends StatefulWidget {
  const Fifth({Key? key}) : super(key: key);

  @override
  _FifthState createState() => _FifthState();
}

class _FifthState extends State<Fifth> {
  String outputText = '010-'; // 출력 창 내용을 저장할 변수

  // 버튼을 누를 때 호출되는 함수
  // 버튼을 누를 때 호출되는 함수
  void updateOutput(String value) {
    setState(() {

      if (value == 'delete' && outputText.isNotEmpty) {

        outputText = outputText.substring(0, outputText.length - 1);
      } else if (value == 'clear') {

        outputText = '010-';
      } else if (outputText.length < 13) {
        outputText = outputText + value;
        if(outputText.length == 8){
          outputText = outputText + '-' ;
        }
      }
    });
  }


  Widget createRoundButton(String label, String value) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/6.3,
      height: MediaQuery.of(context).size.width/12,
      child: RawMaterialButton(
        onPressed: () => updateOutput(value),
        elevation: 3.0,
        fillColor: Color(0xFF49BCF8), // 버튼의 배경색
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // 원하는 모양 설정
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2.1,
                        height: MediaQuery.of(context).size.height/1.3,
                        child: Text('포인트 활용법 이미지'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        width: MediaQuery.of(context).size.width/2.1,
                        height: MediaQuery.of(context).size.height/1.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                '핸드폰 번호를 입력해주세요!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                              padding: EdgeInsets.only(top: 10),
                              width: double.maxFinite,
                              height: 50,
                              child: Text(outputText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                createRoundButton('1', '1'),
                                createRoundButton('2', '2'),
                                createRoundButton('3', '3'),
                              ],
                            ),
                            Row(
                              children: [
                                createRoundButton('4', '4'),
                                createRoundButton('5', '5'),
                                createRoundButton('6', '6'),
                              ],
                            ),
                            Row(
                              children: [
                                createRoundButton('7', '7'),
                                createRoundButton('8', '8'),
                                createRoundButton('9', '9'),
                              ],
                            ),
                            Row(
                              children: [
                                createRoundButton('지우기', 'delete'),
                                createRoundButton('0', '0'),
                                createRoundButton('충전하기', 'clear'),
                              ],
                            ),
                            // ElevatedButton(
                            //   style: ButtonStyle(
                            //     backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF49BCF8)),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.push(context, MaterialPageRoute(builder: (c) => Sixth()));
                            //   },
                            //   child: Text('충전하기'),
                            // ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) => MyApp()));
                    },
                    child: Text('처음으로'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


