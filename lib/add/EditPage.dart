import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/DB/task_model.dart';
import 'package:todo_app/HomePage/TaskData.dart';
import 'package:todo_app/HomePage/home.dart';
import 'package:todo_app/add/AddTaskPage.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();

  void onEdit(){
    final String titleval = titleController.text;
    final String notesVal = descController.text;
    widget.task.Notes = notesVal;
    widget.task.name = titleval;
    Provider.of<TaskData>(context, listen: false).editTask(widget.task);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink[300],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: titleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Note Title",
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter some text";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          minLines: 5,
                          controller: descController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Write notes here",
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter some text";
                            }
                            return value;
                          },
                        ),
                      )
                    ],
                  )
              ),
              SizedBox(height: 40),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                        child: Text('Edit'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onPressed:(){
                          onEdit();
                        },

                      ),
                    ),

                    SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          onPressed:(){
                            Navigator.pop(context);
                          }

                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}