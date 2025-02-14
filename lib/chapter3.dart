import 'package:flutter/material.dart';

void main() {
  runApp(MyMemoApp());
}

class MyMemoApp extends StatelessWidget {
  List<String> items = ['Item 0', 'Item 1', 'Item 2'];

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
                    items.add('New Item');
                    print(items);
                  },
                  style: IconButton.styleFrom(foregroundColor: Colors.white),
                  icon: Icon(Icons.create)
              )
            ],
          ),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('item $index'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      items.removeAt(index);
                      print(items);
                    },
                  ),
                );
              })
      ),
    );
  }
}
