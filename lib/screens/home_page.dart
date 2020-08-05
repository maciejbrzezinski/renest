import 'package:flutter/material.dart';
import 'package:renest/models/task.dart';
import 'package:renest/screens/add_task.dart';
import 'package:renest/widgets/completed_list.dart';
import 'package:renest/widgets/tasks_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          actions: <Widget>[
            FlatButton(
              onPressed: () => newTask(),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Text("Tasks")),
                  Tab(icon: Text("Completed")),
                ],
              ),
              title: TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white70),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [TasksList(tasks), CompletedList(tasks)],
            ),
          ),
        ));
  }

  void newTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTask()),
    ).then((value) {
      if (value != null) {
        setState(() {
          tasks.add(value);
        });
      }
    });
  }
}
