import 'package:flutter/material.dart';
import 'package:navigator_example/main.dart';
import 'package:navigator_example/page/second_page.dart';
import 'package:navigator_example/widget/button_widget.dart';
import 'package:navigator_example/widget/header_widget.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HeaderWidget(title: 'Page 3'),
              ButtonWidget(
                text: 'Pop: Page 2',
                onClicked: () => Navigator.pop(context),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Pop All: Page 1',
                onClicked: () => Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'),
                ),
              ),
            ],
          ),
        ),
      );
}
