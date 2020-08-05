import 'package:flutter_test/flutter_test.dart';
import 'package:renest/models/idea.dart';
import 'package:renest/models/task.dart';

void main() {
  test("generate task from idea test", () {
    var name = "test";
    var idea = Idea(name);
    var task = idea.generateTask(Priority.HIGH);
    expect(task.name, name);
    expect(task.priority, Priority.HIGH);
    expect(task.isCompleted, false);
  });
}
