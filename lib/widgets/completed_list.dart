import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    var tasks = widget.tasks.where((task) => task.isCompleted).toList();

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          Task task = tasks[index];
          return createRow(task);
        });
  }

  Widget createRow(Task task) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.done),
                 ),
                Text(task.name)
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
