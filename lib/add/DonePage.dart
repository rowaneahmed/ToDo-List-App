import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/HomePage/TaskData.dart';
import 'package:todo_app/HomePage/Tasks_list.dart';

class DonePage extends StatefulWidget {
  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Done Page'),backgroundColor: Colors.pink[300],),
      body: Consumer<TaskData>(
        builder: (context, todos, child) => TasksList(tasks: todos.completedTasks),
      ),

    );

    /* Consumer<TaskData>(
          builder: (context, todos, child) => TasksList(tasks: todos.completedTasks),
        ), */


  }
}
