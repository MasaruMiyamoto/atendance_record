import 'package:flutter/material.dart';

//LT発表者抽選画面
class OrderView extends StatefulWidget {
  OrderView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OrderViewState createState() => _OrderViewState();

}

class _OrderViewState extends State<OrderView> {

  final double _textFontSize = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Center(
        child: Text(
          "Text",
          textScaleFactor: _textFontSize,
          ),
      ),
    );
  }
}