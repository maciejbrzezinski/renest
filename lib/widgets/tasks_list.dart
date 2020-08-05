import 'package:flutter/cupertino.dart';
import 'package:renest/models/task.dart';

class TasksList extends StatefulWidget {
  List<Task> tasks;

  TasksList(this.tasks);

  @override
  TasksListState createState() => TasksListState();
}

class TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Text("tasks");
  }
}
