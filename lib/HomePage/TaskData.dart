import 'package:flutter/material.dart';
import '../../DB/task_model.dart';
import 'dart:collection';

import '../DB/DB_Helper.dart';

class TaskData extends ChangeNotifier {
  final List<Task> tasks = [
    // Task(name: 'Finish the app',Notes: 'you can do it',priority: 'High'),
    // Task(name: 'Write a blog post',Notes: 'you can do it',priority: 'Low'),
    // Task(name: 'Share with community',Notes: 'you can do it',priority: 'Medium'),
  ];
  List<Task> get allTasks => tasks;
  List<Task> get incompleteTasks => tasks.where((todo) => !todo.isDone).toList();
  List<Task> get completedTasks => tasks.where((todo) => todo.isDone).toList();
  List<Task> get deletedTasks => tasks.where((todo) => todo.isDeleted).toList();


  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    final taskIndex= tasks.indexOf(task);
    tasks[taskIndex].donechange();
    notifyListeners();
  }

  void archiveTask(Task task) {
    final taskIndex = tasks.indexOf(task);
    tasks[taskIndex].archivedTask();
    if (task.isDone) {
      task.isDone= false;
    }
    notifyListeners();
  }
  void editTask(Task task){
    final taskIndex= tasks.indexOf(task);
    tasks[taskIndex].isEdited;
    notifyListeners();
  }
  void cancelTask(Task task){
    final taskIndex= tasks.indexOf(task);
    tasks[taskIndex].isCanceled;
    notifyListeners();
  }
  void deleteForeverTask(Task task) {
    final taskIndex= tasks.indexOf(task);
    tasks.removeAt(taskIndex);
    notifyListeners();
  }
}