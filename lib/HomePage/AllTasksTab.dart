import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/HomePage/TaskData.dart';
import 'package:todo_app/HomePage/Tasks_list.dart';

class AllTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TaskData>(
        builder: (context, todos, child) => TasksList(tasks: todos.allTasks),
      ),
    );
  }
}

// Text('${Provider.of<TaskData>(context).tasks.length} tasks',style: TextStyle(fontSize: 18),),
/* child: Consumer<TaskData>(
        builder: (context, todos , child) => TasksList(tasks: todos.allTasks) ,
        ), */