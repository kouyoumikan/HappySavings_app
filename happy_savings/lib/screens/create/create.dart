import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // 背景色
      appBar: AppBar(
        title: Text("入力画面"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue, // アプリバーの背景色
      ),
      body: Center(
        child: Text('Next'),
      ),
      // 下部ナビゲーションバーでスクロール
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // アイコンの色をハイライト表示
        items: [
          // BottomNavigationBarItemに表示するリスト
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            title: Text("入力"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("カレンダー"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("設定"),
          ),
        ],
        // ナビゲーションバーのアイコンをタップしたときの処理
        onTap: (int index) {
          setState(
            () {
              // _navIndex = index;
              // _label = _titles[index];
              print(index); // デバッグ用に出力（タップされたボタンによって数値がかわる）
              if (index == 0) {
                // First Icon が押されたときは前の画面に戻る
                // Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/create");
              } else if (index == 1) {
                Navigator.of(context).pushNamed("/calendar");
              } else if (index == 2) {
                Navigator.of(context).pushNamed("/setting");
              }
            },
          );
        },
      ),
    );
  }
}
