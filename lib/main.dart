import 'package:flutter/material.dart';
import 'atendance.dart';
import 'order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
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
              AtendanceList(title: "出席表"),
              OrderList(title: "LT順"),
            ],
          ),
        ),
      ),
    );
  }
}
