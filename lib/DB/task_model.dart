class Task{
  int? id;
  String name;
  String priority;
  String Notes;
  String? date,startTime,endTime;
  bool isDone;
  bool isDeleted;
  bool isEdited;
  bool isCanceled;

  Task({this.id, required this.name,required this.priority, required this.Notes,  this.date, this.startTime,this.endTime, this.isDone = false, this.isDeleted = false, this.isEdited = false, this.isCanceled = false});

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'title' : name,
      'Priority': priority,
      'Notes': Notes,
      'isDone': isDone ? 1:0,
    };
  }

  /* String toString() {
    return 'Task(id : $id, title : $name, Priority: $priority,Notes:$Notes, DateandTime : $dateandtime, isDone : $isDone)';
  } */

  void donechange(){
    isDone = !isDone;
  }
  void archivedTask(){
    isDeleted = !isDeleted;
  }
}