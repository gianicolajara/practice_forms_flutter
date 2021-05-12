import 'package:flutter/material.dart';
import 'package:prueba/pages/my_home_page.dart';
import 'package:prueba/pages/my_second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material APP",
      //home: MyHomePage(),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => MyHomePage(),
        "/second": (BuildContext context) => MySecondPage()
      },
    );
  }
}
