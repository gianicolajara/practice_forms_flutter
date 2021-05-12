import 'package:flutter/material.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SecondPageArgument arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("AppBar desde segunda pagina"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(arguments.name), Text(arguments.lastName)],
          ),
        ));
  }
}

class SecondPageArgument {
  String name;
  String lastName;

  SecondPageArgument({this.name, this.lastName});
}
