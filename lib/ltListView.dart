import 'package:flutter/material.dart';

class LtListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LT決め'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
            itemBuilder: (
            context,
            cnt,
          ) {
            return Text('test');
          },
          //表示するスクロールリストの上限数設定
          //出席者リスト数を設定すればOK
          itemCount: 10,
        ), 
      ),
    );
  }
}