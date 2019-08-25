import 'package:atendance_record/member.dart';
import 'package:flutter/material.dart';

//出席者リスト画面
class AtendanceView extends StatefulWidget {
  AtendanceView({Key key, this.title}) : super(key: key);

  final String title;

  //TODO 何をオーバーライトしてるの？
  @override
  _AtendanceViewState createState() => _AtendanceViewState();
}

class _AtendanceViewState extends State<AtendanceView> {
  int _counter = 0;

  //出席者をリストで持たせる
  // _Atendance atendances[];

  //出席者数のカウント
  //TODO 出席情報クラスを作ってそっちで管理した方がよくない？？
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Show Snackbar',
            onPressed: () {
              print('button push');
            },
          ),
      ],
      ),
      body: ListView.builder( //出席表を表示
        padding:  const EdgeInsets.all(16.0),        
        itemBuilder: (context, cnt){
          Member test = new Member("name : "+cnt.toString(),false, "comName");
          return ListTile(
            title: Text(
              test.name + " + " + test.conpassName,
            ),
          );
        },
      ),
    );
  }
}