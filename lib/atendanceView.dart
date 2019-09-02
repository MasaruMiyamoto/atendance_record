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
      padding:  const EdgeInsets.all(16.0),
      itemBuilder: (context, cnt,){
        return ListTile(
          title: Text(
            "row num :" + cnt.toString() + " , " 
            + _atendanceList[cnt].name + " , " 
            + _atendanceList[cnt].conpassName
          ),
        );
      },
      //表示するスクロールリストの上限数設定
      //出席者リスト数を設定すればOK
      itemCount: _atendanceList.length,
      
    );
  }

}