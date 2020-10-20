import 'package:flutter/material.dart';

import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

// void main() => runApp(ExampleApp());

// class ExampleApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHome(),
//     );
//   }
// }

class Create extends StatefulWidget {
  @override
  CreateState createState() => new CreateState();
}

class CreateState extends State<Create> {
  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
    // final selectedText = Text('You selected: $formattedDate');

    final birthdayTile = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('日付',
              style: TextStyle(
                color: CupertinoColors.systemBlue,
                fontSize: 15.0,
              )),
          const Padding(
            // テキストボックスのデザイン
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          CupertinoDateTextBox(
              // テキストボックスをタップすると開く(日付コールバック)
              initialValue: _selectedDateTime, // 最初に表示される日付
              onDateChange: onBirthdayChange, // 別の日付を選択した場合に呼び出す
              // initialValueが指定されていない場合に表示されるテキスト
              hintText: DateFormat.yMd().format(_selectedDateTime)),
        ],
      ),
    );

    return new Scaffold(
      // body: Padding(
      //   padding: const EdgeInsets.fromLTRB(20, 100, 20, 50),
      //   child: Column(
      //     children: <Widget>[
      //       // selectedText,
      //       const SizedBox(height: 15.0),
      //       birthdayTile,
      //       Divider(
      //         // 区切り線
      //         height: 50, // 区切り線の高さ
      //         thickness: 3, // 区切り線の太さ
      //         color: Colors.amber, // 区切り線の色
      //         // indent: 16, // 区切り線の先頭の余白を指定
      //         // endIndent: 16, // 区切り線の末尾の余白を指定
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Column(
                children: <Widget>[
                  // selectedText,
                  // const SizedBox(height: 15.0),
                  birthdayTile,
                  Divider(
                    // 区切り線
                    height: 50, // 区切り線の高さ
                    thickness: 2, // 区切り線の太さ
                    color: Colors.amber, // 区切り線の色
                    // indent: 16, // 区切り線の先頭の余白を指定
                    // endIndent: 16, // 区切り線の末尾の余白を指定
                  ),
                ],
              ),
            ),
            Text(
              "カレンダー",
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            Divider(
              // 区切り線
              height: 50, // 区切り線の高さ
              thickness: 2, // 区切り線の太さ
              color: Colors.amber, // 区切り線の色
              // indent: 16, // 区切り線の先頭の余白を指定
              // endIndent: 16, // 区切り線の末尾の余白を指定
            ),
            Text(
              "メモ",
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            // タイトル
            TextField(
              // enabled: _isEditiable ? true : false,
              // controller: _titleControllor,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  hintText: 'Title'),
            ),
            SizedBox(
              height: 20,
            ),
            // メモ
            TextField(
              // enabled: _isEditiable ? true : false,
              // controller: _noteControllor,
              keyboardType: TextInputType.multiline,
              maxLines: 10, // テキストボックスの最大サイズ
              minLines: 5, // テキストボックスの最小サイズ
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Memo',
                  hintText: 'Memo'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              textColor: Colors.white,
              child: Text("保存する"),
              color: Colors.amber,
              shape: StadiumBorder(),
              onPressed: () {},
            ),
            // Container(
            //   child: _isEditiable
            //       ? RawMaterialButton(
            //           fillColor: Theme.of(context).accentColor,
            //           shape: StadiumBorder(),
            //           onPressed: () {
            //             _saveNote();
            //           },
            //           child: Text(
            //             'Save',
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         )
            //       : Container(),
            // ),
          ],
        ),
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
            currentIndex: 1, // 現在選択しているアイコンの色をハイライト表示
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

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }
}
