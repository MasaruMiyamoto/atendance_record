import 'package:flutter/material.dart';
import 'atendanceView.dart';
import 'orderView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom:TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_car)),
              ],
            ),
          title: Text('Atendance Record'),
          ),
          body: TabBarView(
            children: <Widget>[
              AtendanceView(title: "Atendance List"),
              OrderView(title: "Lightning Talk Order"),
            ],
          ),
        ),
      ),
    );
  }
}
