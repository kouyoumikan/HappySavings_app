import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // 背景色
      appBar: AppBar(
        title: Text("カレンダー画面"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue, // アプリバーの背景色
      ),
      // 下部ナビゲーションバーのスタイル指定
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // 下部ナビゲーションバーの背景色
            canvasColor: Colors.grey[100],
            // 下部ナビゲーションバーのアイコンの色設定
            primaryColor: Colors.blue, // アイコンの色をハイライト表示
            textTheme: Theme.of(context)
                .textTheme
                // 未選択のアイコンの色
                .copyWith(caption: new TextStyle(color: Colors.grey))),
        // 下部ナビゲーションバーでスクロール
        child: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 2, // 現在選択しているアイコンの色をハイライト表示
            items: [
              // BottomNavigationBarItemに表示するリスト
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("ホーム"),
              ),
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
            onTap: (int index) {
              print(index); // デバッグ用に出力（タップされたボタンによって数値がかわる）
              if (index == 0) {
                // First Icon が押されたときは前の画面に戻る
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/");
              } else if (index == 1) {
                Navigator.of(context).pushNamed("/create");
              } else if (index == 2) {
                Navigator.of(context).pushNamed("/calendar");
              } else if (index == 3) {
                Navigator.of(context).pushNamed("/setting");
              }
            }),
      ),
    );
  }
}
