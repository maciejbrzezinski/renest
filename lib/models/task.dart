enum Priority { LOW, MEDIUM, HIGH }

class Task {
  final String name;
  final Priority priority;
  bool isCompleted = false;

  Task(this.name, this.priority);

  void completeTask() {
    isCompleted = true;
  }
}
