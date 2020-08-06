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
  List<Task> filteredTasks = new List();
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          actions: <Widget>[
            buildNewTaskButton()
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
              title: buildSearchField(),
            ),
            body: TabBarView(
              children: [
                TasksList(filteredTasks),
                CompletedList(filteredTasks)
              ],
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
          textController.text = "";
          updateTasksList("");
        });
      }
    });
  }

  void updateTasksList(String text) {
    setState(() {
      filteredTasks.clear();
      if (text.isEmpty)
        filteredTasks.addAll(tasks);
      else
        tasks
            .where(
                (task) => task.name.toLowerCase().contains(text.toLowerCase()))
            .forEach((task) => filteredTasks.add(task));
    });
  }

  TextField buildSearchField() {
    return TextField(
              controller: textController,
              onChanged: (text) => updateTasksList(text),
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
            );
  }

  FlatButton buildNewTaskButton() {
    return FlatButton(
            onPressed: () => newTask(),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          );
  }
}
