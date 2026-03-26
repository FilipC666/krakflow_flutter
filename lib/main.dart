import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final List<Task> tasks = const [
    Task(title: "Kupić bilet na pociąg", deadline: "jutro", done: false, priority: "wysoki"),
    Task(title: "Oddać książkę do biblioteki", deadline: "poniedziałek", done: false, priority: "niski"),
    Task(title: "Przygotować kolację", deadline: "dzisiaj", done: true, priority: "średni"),
    Task(title: "Nauczyć się Dart", deadline: "w tym tygodniu", done: false, priority: "średni"),
  ];

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int completedTasks = tasks.where((t) => t.done).length;

    return MaterialApp(
      title: 'KrakFlow',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("KrakFlow"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Masz dziś ${tasks.length} zadania (wykonano: $completedTasks)"),
              const SizedBox(height: 16),
              const Text("Dzisiejsze zadania", style: TextStyle(fontSize: 20)),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskCard(task: tasks[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Icon(
            task.done ? Icons.check_circle : Icons.radio_button_unchecked,
            color: Colors.blue,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Termin: ${task.deadline}"),
                Text("Priorytet: ${task.priority}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
