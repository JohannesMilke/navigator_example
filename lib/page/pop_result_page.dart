import 'package:flutter/material.dart';
import 'package:navigator_example/main.dart';
import 'package:navigator_example/widget/button_widget.dart';
import 'package:navigator_example/widget/header_widget.dart';

class PopResultPage extends StatefulWidget {
  final String data;

  const PopResultPage({
    @required this.data,
    Key key,
  }) : super(key: key);

  @override
  _PopResultPageState createState() => _PopResultPageState();
}

class _PopResultPageState extends State<PopResultPage> {
  final controller = TextEditingController();
  dynamic result;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HeaderWidget(title: 'Page PopResult'),
              Text(
                widget.data,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 48),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: 'Result',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onChanged: (value) => result = value,
                ),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Pop With Result',
                onClicked: () => Navigator.pop(context, result),
              ),
            ],
          ),
        ),
      );
}
