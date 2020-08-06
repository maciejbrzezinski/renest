import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
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
    var tasks = widget.tasks;
    if (tasks.length == 0)
      return Center(
          child: Text("Add your first task!", style: TextStyle(fontSize: 17)));
    return GroupedListView(
      elements: tasks,
      groupBy: (element) => (element as Task).getGroupByNumber(),
      groupSeparatorBuilder: _buildGroupSeparator,
      itemBuilder: (context, element) => createRow(element as Task),
      order: GroupedListOrder.ASC,
    );
  }

  Widget _buildGroupSeparator(dynamic groupByValue) {
    String value;
    Color color;
    switch (groupByValue) {
      case 3:
        value = "Low priority";
        color = Colors.blue;
        break;
      case 2:
        value = "Medium priority";
        color = Colors.green;
        break;
      case 1:
        value = "High priority";
        color = Colors.red;
        break;
      default:
        value = "Completed";
        color = Colors.grey;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Text(
          value,
          style: TextStyle(color: color, fontSize: 20),
        ),
      ),
    );
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
                task.isCompleted
                    ? FlatButton(
                        child: Icon(
                          Icons.done,
                          color: Colors.grey,
                        ),
                        onPressed: () => completeTask(task),
                      )
                    : MaterialButton(
                        height: 30,
                        onPressed: () => completeTask(task),
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 1,
                                color: Colors.black,
                                style: BorderStyle.solid)),
                      ),
                Text(task.name,
                    style:
                        TextStyle(color: task.isCompleted ? Colors.grey : null))
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }

  completeTask(Task task) {
    setState(() {
      task.completeTask();
    });
  }
}
