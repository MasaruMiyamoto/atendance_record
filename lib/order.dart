import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  OrderList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OrderListState createState() => _OrderListState();

}

class _OrderListState extends State<OrderList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Center(
        child: Text("Text"),
      ),
    );
  }
}