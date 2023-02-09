import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:todo_app/DB/task_model.dart';
import 'package:todo_app/DB/userModel.dart';


class DatabaseHelperTask{

  // Initialize Database Object
  static Database? _db;


  // Make Init function that will be used to identify the database object
  static void initDB() async{
    var databasesPath = await getDatabasesPath();
    String path = ("${databasesPath}notepadDB.db");

    _db = await openDatabase(path, version: 1, onOpen: (db) {
      print("Database Opened !!");
    }, onCreate: (Database db, int version) async {
      print("Database Created!!");
      await db.execute("CREATE TABLE TASKDATA (id INTEGER PRIMARY KEY, title TEXT, priority TEXT,discription text, endDate TEXT ,IsDone BOOLEAN, userid INTEGER)");
    });
  }

  //Insert new user
  static void  saveTask(Task task) async {
    print("name ${task.name}" + "email ${task.Notes}");
    userModel user=new userModel(fullname: '', email: '');
    int res = await _db!.rawInsert(
        "INSERT INTO TASKDATA (id,title,priority,discription,endDate,IsDone,userid) VALUES (?,?,?,?,?,?,?)",
        [null, task.name,task.priority,task.Notes,task.date,task.isDone,user.id]
    );
    print(res);
  }

  //Getting user
  static Future<List<Task>>getAllTasks() async {
    List<Task> tasks=[];
    var res =await  _db!.query("TASKDATA",);
    if(res.isNotEmpty){
      for(var row in res){
        int id=row["userid"] as int;
        String name = row["title"] as String;
        String priority = row["priority"] as String;
        String Notes = row["discription"] as String;
        String date = row["endDate"] as String;
        int isDone = row["IsDone"] as int;
        Task task=new Task(
          id: id,
          name: name,
          priority: priority,
          Notes: Notes,
          date: date,
          isDone: isDone==1,
        );
        tasks.add(task);
      }

    }
    return tasks;
  }



  //Update user
  static void updatetaskinformation(Task task)  async {
    var res =await  _db!.update("TASKDATA",{'title':task.name,'discription':task.Notes}, where: "id = ?", whereArgs: [task.id]);
  }

  //Delete user
  static void deletetask(int id) async {
    var res =await  _db!.delete("TASKDATA",where: "id = ?", whereArgs: [id]);
  }
  closeDB() async =>await _db!.close();

}