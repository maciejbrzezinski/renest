import 'package:flutter/material.dart';
import 'package:renest/screens/add_task.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            onPressed: () => newTask(),
            child: Icon(Icons.add),
          )
        ],
      ),
      body: Center(),
    );
  }

  void newTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTask()),
    ).then((value) {
      setState(() {

      });
    });
  }
}
