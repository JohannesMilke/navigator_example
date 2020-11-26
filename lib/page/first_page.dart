import 'package:flutter/material.dart';
import 'package:navigator_example/main.dart';
import 'package:navigator_example/page/pop_result_page.dart';
import 'package:navigator_example/page/second_page.dart';
import 'package:navigator_example/page/willpop_page.dart';
import 'package:navigator_example/widget/button_widget.dart';
import 'package:navigator_example/widget/header_widget.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderWidget(title: 'Page 1'),
              ButtonWidget(
                text: 'Push: Page 2',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                ),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Replace: Page 2',
                onClicked: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                ),
              ),
              Divider(height: 48),
              ButtonWidget(
                text: 'Push: Page WillPopScope',
                onClicked: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WillPopScopePage()),
                ),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'Push: Page PopResult',
                onClicked: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PopResultPage(
                        data: 'Some data from Page 1',
                      ),
                    ),
                  );

                  scaffoldKey.currentState
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(content: Text('Got result: ${result}')),
                    );
                },
              ),
            ],
          ),
        ),
      );
}
