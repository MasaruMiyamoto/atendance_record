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
    labels: {"開始日": "date", "タイトル": "task", "優先度": "pri count"},
  );

  @override
  Widget build(BuildContext context) {
    return DocumentListScaffold(
      documentList,
      title: "タスク",
    );
  }
}