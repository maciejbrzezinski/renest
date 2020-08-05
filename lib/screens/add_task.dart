import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renest/models/idea.dart';
import 'package:renest/samples/sample_data.dart';
import 'package:renest/widgets/ideas_list.dart';

class AddTask extends StatefulWidget {
  @override
  AddTaskState createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  final String title = "Add Task";
  List<Idea> sampleIdeas = IdeaHub.ideas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: IdeasList(sampleIdeas),
    );
  }
}
