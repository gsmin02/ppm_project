// 2025-02-05
// 아이템 목록 및 버튼 기능 구현

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
            title: const Text('Memo', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                  onPressed: () {
                    print('클릭');
                  },
                  style: IconButton.styleFrom(foregroundColor: Colors.white),
                  icon: Icon(Icons.create)),
            ],
          ),
          body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('item $index'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      print('delete $index');
                    },
                  ),
                );
              })
      ),
    );
  }
}
