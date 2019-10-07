import 'package:flutter/material.dart';
import 'member.dart';

class AddMemberView extends StatefulWidget {
  @override
  _AddMemberViewState createState() => _AddMemberViewState();

}

class _AddMemberViewState extends State<AddMemberView> {
  final _nameController = TextEditingController();
  final _conpassNameController = TextEditingController();
  bool _isCheck = false;

  bool checkInput() {
    if (_nameController.text.isNotEmpty && _conpassNameController.text.isNotEmpty){
      return true;
    }
    return false;
  }

  Member createMember() {
    if (!checkInput()) {
      return null;
    }
    return Member(_nameController.text, _conpassNameController.text, _isCheck);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '追加',
      home: Scaffold(
        appBar: AppBar(
          title: Text('追加画面'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //ユーザーを追加せずに戻る
              print('push back');
              Navigator.pop(context, null);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                //新規メンバー情報を返す
                print('push check');
                Navigator.pop(context, createMember());
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 80.0,
                ),
                Row(
                  children: <Widget>[
                    Text('Lightning Talk'),
                    Checkbox(
                      value: _isCheck,
                      onChanged: (bool check) {
                        setState(() {
                          _isCheck = check;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  controller: _nameController,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'ConpassName'),
                  controller: _conpassNameController,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                FloatingActionButton(
                  child: Icon(Icons.check),
                  onPressed: () {
                    //新規メンバー情報を返す
                    Navigator.pop(context, createMember());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
