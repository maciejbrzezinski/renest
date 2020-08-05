import 'package:flutter_test/flutter_test.dart';
import 'package:renest/models/task.dart';

void main() {
  test("complete task test", () {
    var task = Task("test", Priority.MEDIUM);
    expect(task.isCompleted, false);
    task.completeTask();
    expect(task.isCompleted, true);
  });
}
