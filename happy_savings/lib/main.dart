import 'package:flutter/material.dart';
import 'package:happy_savings/screens/calendar/calendar.dart';
import 'package:happy_savings/screens/create/create.dart';
import 'package:happy_savings/screens/setting/setting.dart';

void main() => runApp(MaterialApp(
      initialRoute: "/", // アプリ起動時に呼び出されるルート
      routes: {
        "/": (context) => Home(), // ホーム画面
        // "/loading": (context) => Loading(), // ロード画面
        "/create": (context) => Create(), // 入力画面
        "/calendar": (context) => Calendar(), // カレンダー画面
        "/setting": (context) => Config(), // 設定画面
      },
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // 背景色
      appBar: AppBar(
        title: Text("しあわせ貯金"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue, // アプリバーの背景色
      ),
      // 下部ナビゲーションバーでスクロール
      bottomNavigationBar: BottomNavigationBar(
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
          print(index); // デバッグ用に出力（タップされたボタンによって数値がかわる）
          if (index == 0) {
            Navigator.of(context).pushNamed("/create");
          } else if (index == 1) {
            Navigator.of(context).pushNamed("/calendar");
          } else if (index == 2) {
            Navigator.of(context).pushNamed("/setting");
          }
          // setState(
          //   () {
          //     // _navIndex = index;
          //     // _label = _titles[index];
          //     print(index); // デバッグ用に出力（タップされたボタンによって数値がかわる）
          //     if (index == 0) {
          //       Navigator.of(context).pushNamed("/create");
          //     } else if (index == 1) {
          //       Navigator.of(context).pushNamed("/calendar");
          //     } else if (index == 2) {
          //       Navigator.of(context).pushNamed("/setting");
          //     }
          //   },
          // );
        },
        // currentIndex: _navIndex,
      ),
      // body: Column(
      //   children: <Widget>[
      //     Expanded(
      //       child: Center(
      //         child: Text(
      //           _label,
      //           style: TextStyle(fontSize: 24.0),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // var _navIndex = 0;
//   // var _label = '';
//   // var _titles = ["入力", "カレンダー", "設定"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200], // 背景色
//       appBar: AppBar(
//         title: Text("しあわせ貯金"),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.lightBlue, // アプリバーの背景色
//       ),
//       // 下部ナビゲーションバーでスクロール
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           // BottomNavigationBarItemに表示するリスト
//           BottomNavigationBarItem(
//             icon: Icon(Icons.create),
//             title: Text("入力"),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             title: Text("カレンダー"),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             title: Text("設定"),
//           ),
//         ],
//         // ナビゲーションバーのアイコンをタップしたときの処理
//         onTap: (int index) {
//           setState(
//             () {
//               // _navIndex = index;
//               // _label = _titles[index];
//               print(index); // デバッグ用に出力（タップされたボタンによって数値がかわる）
//               if (index == 0) {
//                 Navigator.of(context).pushNamed("/create");
//               } else if (index == 1) {
//                 Navigator.of(context).pushNamed("/calendar");
//               } else if (index == 2) {
//                 Navigator.of(context).pushNamed("/setting");
//               }
//             },
//           );
//         },
//         // currentIndex: _navIndex,
//       ),
//       // body: Column(
//       //   children: <Widget>[
//       //     Expanded(
//       //       child: Center(
//       //         child: Text(
//       //           _label,
//       //           style: TextStyle(fontSize: 24.0),
//       //         ),
//       //       ),
//       //     )
//       //   ],
//       // ),
//     );
//   }
// }
