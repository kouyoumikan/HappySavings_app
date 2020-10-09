import 'package:flutter/material.dart';

import 'package:intl/intl.dart' show DateFormat;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class Calendar extends StatefulWidget {
  // Calendar({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime.now(); // onDayPressed関数
  // Eventを設定するため、メンバにEventのからのリストを持たせる
  EventList<Event> _markedDateMap = EventList<Event>();

  // カレンダーにタップした際にアイコンを追加
  void onDayPressed(DateTime date, List<Event> events) {
    this.setState(() => _currentDate = date);
    // FlutterToastを利用してタップ時に、日付を表示
    // Fluttertoast.showToast(msg: date.toString());
    if (events.length == 0) {
      // カレンダー上にEventが作成されていなければEventListに表示
      Fluttertoast.showToast(msg: date.toString());
      addEvent(date);
    } else {
      Fluttertoast.showToast(msg: events[0].title);
    }
    // addEvent(date);
  }

  void addEvent(DateTime date) {
    // カレンダー上にEventが作成されていなければEventListに表示
    _markedDateMap.add(date, createEvent(date));
  }

  Event createEvent(DateTime date) {
    // カレンダーに表示するアイコンのレイアウトを作成
    return Event(
        date: date, // Eventを作りたい(予定を作りたい)日のDateTime
        title: date.day.toString(), // タップした時に表示するための文字列(今回は日にち)
        icon: Container(
            // カレンダーに表示するアイコン
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue, width: 1.0)),
            child: Icon(
              Icons.calendar_today,
              color: Colors.blue,
            )));
  }

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
      body: Container(
        child: CalendarCarousel<Event>(
            // 日付をタップした際の挙動の設定
            onDayPressed: onDayPressed,
            weekendTextStyle: TextStyle(color: Colors.red), // 土日のテキストのスタイルを指定
            thisMonthDayBorderColor: Colors.grey, // 日付の枠に線を入れる
            weekFormat: false, // 週ごとに表示するかどうか設定(月ごとに表示したい場合にはfalseを指定)
            height: 420.0,
            // 初回ビルド時にどの項目を選択しているか設定(DateTime.now()で今日の日付を選択するように指定)
            selectedDateTime: _currentDate,
            locale: 'JA', // デフォルトの言語は、Englishなので日本語での指定
            daysHaveCircularBorder: false, // 枠線を丸に設定(四角い枠線はfalseを指定)
            // カレンダーのGridViewに縦スクロールを入れたくない場合、NeverScrollableScrollPhysicsを入れる
            customGridViewPhysics: NeverScrollableScrollPhysics(),
            markedDatesMap: _markedDateMap, // 追加
            markedDateShowIcon: true,
            markedDateIconMaxShown: 2,
            todayTextStyle: TextStyle(
              color: Colors.blue,
            ),
            markedDateIconBuilder: (event) {
              return event.icon;
            },
            todayBorderColor: Colors.green,
            markedDateMoreShowTotal: false),
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
