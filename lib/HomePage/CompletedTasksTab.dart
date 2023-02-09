import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/HomePage/TaskData.dart';
import 'package:todo_app/HomePage/Tasks_list.dart';

class CompletedTasksTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TaskData>(
        builder: (context, todos , child) => TasksList(tasks: todos.completedTasks) ,
      ),
    );
  }
}