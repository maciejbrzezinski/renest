enum Priority { LOW, MEDIUM, HIGH }

class Task {
  final String name;
  final Priority priority;
  bool isCompleted = false;

  Task(this.name, this.priority);

  void completeTask() {
    isCompleted = true;
  }

  int getGroupByNumber() {
    if (isCompleted) return 4;
    if (priority == Priority.LOW) return 3;
    if (priority == Priority.MEDIUM) return 2;
    return 1;
  }
}
