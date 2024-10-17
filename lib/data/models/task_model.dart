import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final String description;
  final Map<String, dynamic> category;
  bool? isDone;
  final int taskPriority;
  final String startTime; 
  final String? endTime; 
  final DateTime date;

  TaskModel({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    required this.taskPriority,
    required TimeOfDay startTime, 
    TimeOfDay? endTime, 
    required this.date,
  })  : startTime = '${startTime.hour}:${startTime.minute}', // Convert to string
        endTime = endTime != null ? '${endTime.hour}:${endTime.minute}' : null; // Convert to string

  factory TaskModel.fromJson(data) {
    // Parse the start and end time strings back to TimeOfDay
    final startTimeSplit = data['startTime'].split(':');
    final endTimeSplit = data['endTime']?.split(':');
    
    return TaskModel(
      title: data['title'],
      description: data['description'],
      category: data['category'],
      isDone: data['is_done'],
      taskPriority: data['task_priority'],
      startTime: TimeOfDay(
        hour: int.parse(startTimeSplit[0]),
        minute: int.parse(startTimeSplit[1]),
      ),
      endTime: endTimeSplit != null
          ? TimeOfDay(
              hour: int.parse(endTimeSplit[0]),
              minute: int.parse(endTimeSplit[1]),
            )
          : null,
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
      'startTime': startTime, // Already converted to string
      'endTime': endTime, // Already converted to string
      'date': date.toIso8601String()
    };
  }
}
