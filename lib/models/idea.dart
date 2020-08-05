import 'package:renest/models/task.dart';

class Idea {
  final String name;

  Idea(this.name);

  Task generateTask(Priority priority) {
    return Task(name, priority);
  }
}
