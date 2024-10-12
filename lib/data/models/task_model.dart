// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'category_model.dart';

class TaskModel {
  final String title;
  final String description;
  final CategoryModel category;
  bool? isDone ;
  final int taskPriority;
  final DateTime startTime;
  final DateTime? endTime;
  final DateTime date;

  TaskModel({
    required this.title,
    required this.description,
    required this.category,
     this.isDone=false,
    required this.taskPriority,
    required this.startTime,
     this.endTime,
    required this.date,
  });

  factory TaskModel.fromJson(data) {
    return TaskModel(
      title: data['title'],
      description: data['description'],
      category: CategoryModel.fromJson(data['category']),
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
      'category': category.toJson(),
      'is_done': isDone,
      'task_priority': taskPriority,
      'startTime': startTime,
      'endTime': endTime,
      'date': date
    };
  }
}
