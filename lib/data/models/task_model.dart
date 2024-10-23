import 'package:flutter/material.dart';

class TaskModel {
  final String? id;
  final String title;
  final String description;
  final Map<String, dynamic> category;
  bool? isDone;
  final int taskPriority;
  final String startTime; 
  final String? endTime; 
  final DateTime date;

  TaskModel( {
      this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    required this.taskPriority,
    required TimeOfDay startTime, 
    TimeOfDay? endTime, 
    required this.date,
  })  : startTime = '${startTime.hour}:${startTime.minute}', 
        endTime = endTime != null ? '${endTime.hour}:${endTime.minute}' : null; 

factory TaskModel.fromJson( data, [String? id]) {
  final startTimeSplit = data['startTime'].split(':');
  final endTimeSplit = data['endTime']?.split(':');

  return TaskModel(
    id: id,
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
      'startTime': startTime, 
      'endTime': endTime, 
      'date': date.toIso8601String()
    };
  }
}
