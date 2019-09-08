import 'package:atendance_record/member.dart';
import 'package:flutter/material.dart';

//出席者リスト画面
class AtendanceView extends StatefulWidget {
  //コンストラクタ
  AtendanceView({Key key, this.title}) : super(key: key);

  final String title;

  //TODO 何をオーバーライトしてるの？
  @override
  _AtendanceViewState createState() => _AtendanceViewState();
}

class _AtendanceViewState extends State<AtendanceView> {
  
  //出席者リスト
  List<Member> _atendanceList = new List<Member>();

  //メンバーの設定
  //最終的に画面で設定した出席者をリストに格納する。
  Member _member = new Member("name", false, "compassName");

  @override
  Widget build(BuildContext context) {

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
                _atendanceList.add(_member);
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
      margin: EdgeInsets.all(15.0),
      //カードの配置
      child: Row(
        children: <Widget>[
          //チェックボックス
          _createAtendanceCheck(index),
          //情報
          Column(
            children: <Widget>[
              Text(_atendanceList[index].name, textScaleFactor: _FONT_SCALE_SIZE),
              Text(_atendanceList[index].conpassName, textScaleFactor: _FONT_SCALE_SIZE),
            ],
          ),
        ],
      ),
    );
  }

  //index番目の出席者情報を取得
  ListTile _formatMenberInfo(int index) {
    return ListTile(
          title: Text(
            "row num :" + index.toString() + " , " 
            + _atendanceList[index].name + " , " 
            + _atendanceList[index].conpassName
          ),
        );
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