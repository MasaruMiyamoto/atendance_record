import 'package:atendance_record/addMemberView.dart';
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
  void initState() {
    super.initState();
    print('call init');
    //出席者リストの初期化
    _initAtendanceList();
  }

  @override
  Widget build(BuildContext context) {

    //appBarを定義
    Widget _appBar = AppBar(
      title: Text(widget.title),
      //AppBar右上にアプリバーを設置
      //＋ボタンを押下することで、出席者を追加する。（未実装）
      actions: <Widget>[
        //LT順番決め画面へ繊維
        IconButton(
          icon: const Icon(Icons.sort),
          tooltip: 'LT順を決める',
          onPressed: () {
            //出席者リストを更新
            setState(() {
              //TODO ユーザー追加画面を表示
              print('push menu');
            });
          },
        ),
      ],
    );

    //Cardを子Widgetに持つ出席者リストを定義
    Widget _listView = ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (
        context,
        cnt,
      ) {
        // return _formatMenberInfo(cnt);
        return _createCard(cnt);
      },
      //表示するスクロールリストの上限数設定
      //出席者リスト数を設定すればOK
      itemCount: _atendanceList.length,
    );

    Widget _floatingActionButton = FloatingActionButton(
      child: Icon(Icons.add),
      tooltip: 'ユーザーを追加',
      onPressed: () {
        print('push add');
        _callAddMemberPage(context);
      },
    );

    //土台の作成
    return Scaffold(
      appBar: _appBar,
      body: _listView,
      floatingActionButton: _floatingActionButton,
    );
  }

  //出席者情報カードの作成
  Card _createCard(int index) {
    const _FONT_SCALE_SIZE = 1.5;
    return Card(
      margin: EdgeInsets.all(5.0),
      //カードの配置
      child: Row(
        children: <Widget>[
          //チェックボックス
          Checkbox(
            value: _atendanceList[index].isAtendance(),
            // value: true,
            onChanged: (bool changeBool) {
              setState(() {
                _atendanceList[index].setAtendanceFlg(changeBool);
              });
            },
          ),
          //情報
          Text(
            _atendanceList[index].getName(),
            textScaleFactor: _FONT_SCALE_SIZE
          ),
          SizedBox(width: 10.0,),
          Text(
            '(' + _atendanceList[index].getConpassName() + ')',
            textScaleFactor: _FONT_SCALE_SIZE
          ),
          SizedBox(width: 10.0,),
          Text(
            _atendanceList[index].isLt() ? 'LT' : '',
            textScaleFactor: _FONT_SCALE_SIZE
          ),
          SizedBox(width: 3.0,),
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.cyan,
            onPressed: () {
              _callAddMemberPage(context);
            },
          ),
        ],
      ),
    );
  }

  void _callAddMemberPage(BuildContext context) async{
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddMemberView())
    );

    print('result = $result');
    if (result != null){
      _atendanceList.add(result);
    }

  }

  void _initAtendanceList() {
    _atendanceList.add(new Member("User1", "compassName1", true));
    _atendanceList.add(new Member("User2", "compassName2", true));
    _atendanceList.add(new Member("User3", "compassName3", true));
  }

}
