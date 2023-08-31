import 'package:deego_v2/main.dart';
import 'package:deego_v2/third.dart';
import 'package:flutter/material.dart';


class Fourth extends StatelessWidget {
  const Fourth({super.key});

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
                // sliderWidget(),
                // sliderIndicator(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ElevatedButton(onPressed: (){
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (c) => Fourth();));
                }, child: Text('다음으로')),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => Third()));
                }, child: Text('이전으로')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
