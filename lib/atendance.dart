import 'package:flutter/material.dart';

class AtendanceList extends StatefulWidget {
  AtendanceList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AtendanceListState createState() => _AtendanceListState();
}

class _AtendanceListState extends State<AtendanceList> {
  int _counter = 0;

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
      ),
      body: ListView.builder(
        padding:  const EdgeInsets.all(16.0),
        itemBuilder: (context, i){
          return ListTile(
            title: Text(
              "山田　太郎",
            ),
          );
        },
      ),
    );
  }
}