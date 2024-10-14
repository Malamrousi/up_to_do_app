
class TaskModel {
  final String title;
  final String description;
  final Map<String, dynamic> category;
  bool? isDone;
  final int taskPriority;
  final DateTime startTime;
  final DateTime? endTime;
  final DateTime date;

  TaskModel({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    required this.taskPriority,
    required this.startTime,
    this.endTime,
    required this.date,
  });

  factory TaskModel.fromJson(data) {
    return TaskModel(
      title: data['title'],
      description: data['description'],
      category: data['category'],
      isDone: data['is_done'],
      taskPriority: data['task_priority'],
      startTime: DateTime.parse(data['startTime']),
      endTime: DateTime.parse(data['endTime']),
      date: DateTime.parse(data['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'is_done': isDone,
      'task_priority': taskPriority,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'date': date.toIso8601String()
    };
  }
}
