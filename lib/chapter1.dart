// 2025-01-30
// 앱 화면 띄우기 및 이미지 불러오기

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Container 위젯 예제',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
              width: 200,
              height: 500,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '컨테이너 안의 텍스트',
                    style: TextStyle(color: Colors.white),
                  ),
                  Image.asset(
                    'images/flutter.png',
                    width: 200,
                    height: 200,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 50.0,
                  ),
                ],
              )),
        ),
        // body: Center(
        //   child: Icon(
        //     Icons.favorite,
        //     color: Colors.pink,
        //     size: 50.0,
        //   ),
        // ),
        // body: Center(
        //   child: Image.asset(
        //     'images/flutter.png',
        //     width: 200,
        //     height: 200,
        //   ),
        // ),
      ),
    );
  }
}
