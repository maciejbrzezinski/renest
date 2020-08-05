import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renest/models/idea.dart';
import 'package:renest/models/task.dart';
import 'package:renest/samples/sample_data.dart';

class IdeasList extends StatefulWidget {
  final List<Idea> ideas;

  IdeasList(this.ideas);

  @override
  IdeasListState createState() => IdeasListState();
}

class IdeasListState extends State<IdeasList> {
  int clickedIndex;

  @override
  Widget build(BuildContext context) {
    var ideas = widget.ideas;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: ideas.length,
        itemBuilder: (BuildContext context, int index) {
          Idea idea = ideas[index];
          if (clickedIndex == index) return createClickedRow(idea);
          return createNotClickedRow(idea, index);
        });
  }

  Widget createNotClickedRow(Idea idea, int index) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(idea.name),
                FlatButton(
                  child: Icon(Icons.add),
                  onPressed: () => clickIdea(index),
                )
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }

  void clickIdea(int index) {
    setState(() {
      clickedIndex = index;
    });
  }

  Widget createClickedRow(Idea idea) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                createPriorityButton(idea, Priority.HIGH),
                createPriorityButton(idea, Priority.MEDIUM),
                createPriorityButton(idea, Priority.LOW),
                FlatButton(
                  child: Icon(Icons.cancel),
                  onPressed: () => unClickIdea(),
                ),
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }

  SizedBox createPriorityButton(Idea idea, Priority priority) {
    String title;
    Color color;
    if (priority == Priority.HIGH) {
      color = Colors.red;
      title = "High";
    } else if (priority == Priority.MEDIUM) {
      color = Colors.green;
      title = "Medium";
    } else {
      color = Colors.blue;
      title = "Low";
    }

    return SizedBox(
      width: 90,
      child: FlatButton(
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title + " priority",
            textAlign: TextAlign.center,
          ),
        ),
        onPressed: () => createTask(idea, priority),
      ),
    );
  }

  createTask(Idea idea, Priority priority) {
    var task = idea.generateTask(priority);
    IdeaHub.markIdeaAsAdded(idea);
    Navigator.of(context).pop(task);
  }

  unClickIdea() {
    setState(() {
      clickedIndex = null;
    });
  }
}
