import 'package:atendance_record/RapidoExample.dart';
import 'package:atendance_record/atendanceView.dart';
import 'package:atendance_record/orderView.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom:TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.add_a_photo)),
              ],
            ),
          title: Text('Atendance Record'),
          ),
          body: TabBarView(
            children: <Widget>[
              AtendanceView(title: "Atendance List"),
              OrderView(title: "Lightning Talk Order"),
              RapidoExample(title: "Rapido Test"),
            ],
          ),
        ),
      ),
    );
  }
}
