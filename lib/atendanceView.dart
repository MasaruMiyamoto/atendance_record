import 'package:atendance_record/member.dart';
import 'package:flutter/material.dart';

//出席者リスト画面
class AtendanceView extends StatefulWidget {
  //コンストラクタ
  AtendanceView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AtendanceViewState createState() => _AtendanceViewState();
}

class _AtendanceViewState extends State<AtendanceView> {
  
  //出席者リスト
  List<Member> _atendanceList = new List<Member>();

  @override
  Widget build(BuildContext context) {

    //出席者リストの初期化
    initAtendanceList();

    //土台の作成
    return Scaffold(
      appBar: _createAppBar(),
      body: _createListView(),
    );
  }

  //AppBarを設定
  AppBar _createAppBar() {
    return AppBar(
        title: Text(widget.title),
        //AppBar右上にアプリバーを設置
        //＋ボタンを押下することで、出席者を追加する。（未実装）
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Show Snackbar',
            onPressed: () {
              //出席者リストを更新
              print('button push');
              setState((){
                //TODO ユーザー追加画面を表示
                  print('call button');
              });
            },
          ),
      ],
    );
  }

  //出席者リストを表示
  ListView _createListView(){
    return ListView.builder(
      padding:  const EdgeInsets.all(10.0),
      itemBuilder: (context, cnt,){
        // return _formatMenberInfo(cnt);
        return _createCard(cnt);
      },
      //表示するスクロールリストの上限数設定
      //出席者リスト数を設定すればOK
      itemCount: _atendanceList.length,
    );
  }

   //出席者情報カードの作成
   Card _createCard(int index){
    const _FONT_SCALE_SIZE  = 1.5;
    return Card(
      margin: EdgeInsets.all(5.0),
      //カードの配置
      child: Row(
        children: <Widget>[
          //チェックボックス
          _createAtendanceCheck(index),
          //情報
          Column(
            children: <Widget>[
              Text(_atendanceList[index].name, textScaleFactor: _FONT_SCALE_SIZE),
            ],
          ),
        ],
      ),
    );
  }

  void initAtendanceList(){
    _atendanceList.add(new Member("name1", true, "compassName1"));
    _atendanceList.add(new Member("name2", false, "compassName2"));
    _atendanceList.add(new Member("name3", true, "compassName3"));
  }

  Checkbox _createAtendanceCheck(int index){
    return Checkbox(
      value: _atendanceList[index].ltFlg,
        onChanged: (bool changeBool){
          setState(() {
            _atendanceList[index].ltFlg = changeBool;
        });
      },
    );
  }
}