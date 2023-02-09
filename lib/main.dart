import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/DB/DB_Helper2.dart';
import 'package:todo_app/HomePage/TaskData.dart';
import 'package:todo_app/pages/welcome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDB();
  DatabaseHelper.getALLuser();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: welcome(),
      ),
    );
  }
}