import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // 背景色
      appBar: AppBar(
        title: Text("設定画面"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue, // アプリバーの背景色
      ),
      body: ListView(
        padding: EdgeInsets.all(36.0),
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('テーマカラー'),
              onTap: () {
                Navigator.of(context).pushNamed("/theme");
              },
            ),
            Divider(
              // 区切り線
              height: 40,
              thickness: 3,
              color: Colors.amber,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              title: Text('しあわせテーマイメージ図'),
            ),
            Divider(
              // 区切り線
              height: 40,
              thickness: 3,
              color: Colors.amber,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              title: Text('アプリの使い方'),
            ),
            Divider(
              // 区切り線
              height: 40,
              thickness: 3,
              color: Colors.amber,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              title: Text('お客様サポート'),
            ),
          ],
        ).toList(),
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
            currentIndex: 3, // 現在選択しているアイコンの色をハイライト表示
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
