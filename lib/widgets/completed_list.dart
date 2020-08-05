import 'package:flutter/cupertino.dart';
import 'package:renest/models/task.dart';

class CompletedList extends StatefulWidget {
  List<Task> tasks;

  CompletedList(this.tasks);

  @override
  CompletedListState createState() => CompletedListState();
}

class CompletedListState extends State<CompletedList> {
  @override
  Widget build(BuildContext context) {
    return Text("completed");
  }
}
