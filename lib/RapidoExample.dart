import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rapido/rapido.dart';

//Rapidoクラス
//Rapidoパッケージを使用
////  dependencies:
////    rapido: ^0.0.12
//もっと新しいバージョンあるんじゃね？？？
class RapidoExample extends StatefulWidget {
  RapidoExample({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RapidoExampleState createState() => _RapidoExampleState();
}

class _RapidoExampleState extends State<RapidoExample> {
  final DocumentList documentList = DocumentList(
    "task list",
    labels: {"チェック": "done ?", "開始日": "date", "タイトル": "task", "優先度": "pri count", "ノート": "note"},
  );

  @override
  Widget build(BuildContext context) {
    return DocumentListScaffold(
      documentList,
      title: "タスク",
      //タイトルに表示するキーのリスト
      // titleKeys: ["date", "task", "pri count"],
      // //subtitleKeyは複数行表示可能
      // subtitleKey: "note",
      //デザインの変更
      decoration: BoxDecoration(color: Colors.orange),
      //項目の表示変更。titleKeyとsubtitleKeyとの併用はできない。
      // customItemBuilder: _customBuilder,
      emptyListWidget: Center(
        child: Text(
          "ボタンを押してタスクを追加",
          textAlign: TextAlign.center
        ),
      ),
    );
  }

  Widget _customBuilder(int index, Document doc, BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text(documentList[index]["pri count"].toString(),
          //     style: Theme.of(context).textTheme.display1),
          // ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(          
              documentList[index]["complete"],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(documentList[index]["task"],style: Theme.of(context).textTheme.title),
                Text(documentList[index]["date"].toString()),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(documentList[index]["note"])
                )
              ],
            ),
          ),
          DocumentActionsButton(documentList, index: index)
        ],
      ),
      color: _calculateColor(documentList[index]["pri count"]),
    );
  }

  Color _calculateColor(int priority) {
    if (priority < 3) {
      return Colors.red;
    } else if (priority < 7) {
      return Colors.yellow;
    }
    return Colors.green;
  }
}