class Task {
  final String title;
  final String deadline;
  final bool done;
  final String priority;

  const Task({
    required this.title,
    required this.deadline,
    required this.done,
    required this.priority,
  });
}

class TaskRepository {
  static List<Task> tasks = [
    Task(title: "Kupić bilet na pociąg", deadline: "jutro", done: false, priority: "wysoki"),
    Task(title: "Oddać książkę do biblioteki", deadline: "poniedziałek", done: false, priority: "niski"),
    Task(title: "Przygotować kolację", deadline: "dzisiaj", done: true, priority: "średni"),
    Task(title: "Nauczyć się Dart", deadline: "w tym tygodniu", done: false, priority: "średni"),
  ];
}