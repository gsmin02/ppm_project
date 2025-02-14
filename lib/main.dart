import 'package:flutter/material.dart';
import 'models/memo_data.dart';

void main() {
  runApp(MyMemoApp());
}

class MyMemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyMemoAppPage(),
    );
  }
}

class MyMemoAppPage extends StatefulWidget {
  @override
  State<MyMemoAppPage> createState() => _MyMemoAppPageState();
}

class _MyMemoAppPageState extends State<MyMemoAppPage> {
  List<MemoData> items = [
    MemoData(content: 'Memo 1', createAt: DateTime(2022, 2, 10)),
    MemoData(content: 'Memo 2', createAt: DateTime(2023, 2, 11)),
    MemoData(content: 'Memo 3', createAt: DateTime(2024, 2, 12)),
    MemoData(content: 'Memo 4', createAt: DateTime(2025, 2, 13))
  ];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                items.add(MemoData(content: 'New Item', createAt: DateTime.now()));
                print(items);
              });
            },
            style: IconButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.create),
          )
        ],
      ),
      body: Column(
        children: groupMemoDataByYear(items).entries.map((entry) {
          return Column(
            children: [
              Padding(padding: EdgeInsets.all(10), child: Text('${entry.key}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
            CustomListView(
            items: entry.value,
            onDelete: (customItem) {
              setState(() {
                items.remove(customItem);
                print(items);
              });
            }
          )
            ],
          );
        }).toList(),
      )
    );
  }

  Map<int, List<MemoData>> groupMemoDataByYear(List<MemoData> items) {
    Map<int, List<MemoData>> memoByYear = {};

    for(var item in items) {
      int year = item.createAt.year;

      if(!memoByYear.containsKey(year)) {
        memoByYear[year] = [];
      }
      memoByYear[year]?.add(item);
    }
    return memoByYear;
  }
}

class CustomListView extends StatelessWidget {
  final List<MemoData> items;
  final Function(MemoData ) onDelete;
  const CustomListView({super.key, required this.items, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        var customItem = items[index];
        // 각 메모 아이템을 나타내는 ListTile
        return ListTile(
          title: Text(items[index].content),
          subtitle: Text('${items[index].createAt}'),
          tileColor: Colors.lightBlue[50],
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
             onDelete(customItem);
            },
          ),
        );
      },
    );
  }
}
