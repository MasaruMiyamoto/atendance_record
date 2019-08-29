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
  
  List<Member> _testList = new List<Member>();
  Member _test = new Member("name", false, "compassName");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _createAppBar(),
      body: _createListView(),
    );
  }

  //AppBarを設定
  AppBar _createAppBar() {
    return AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Show Snackbar',
            onPressed: () {
              print('button push');
              setState((){
                _testList.add(_test);
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
            + _testList[cnt].name + " , " 
            + _testList[cnt].conpassName
          ),
        );
      },
      //表示するスクロールリストの上限数設定
      //出席者リスト数を設定すればOK
      itemCount: _testList.length,
    );
  }

}